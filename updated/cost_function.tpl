Description: Daily cost SMS alerts to the number mentioned in YourMobile
Mappings:
  myregion:
    key01:
      YourMobile: 9198198384660
Resources:
  DailyCostAlert:
    Properties:
      Code:
        ZipFile: >
            def handler(event, context):
                
                import boto3
                import datetime
                from collections import defaultdict
                import os
                
                m_number = os.environ['mobile_number']
                
                client = boto3.client("sns", region_name="us-east-1")
                cd = boto3.client('ce')
                
                now = datetime.datetime.utcnow()
                start = (now - datetime.timedelta(days=2)).strftime('%Y-%m-%d')
                end = now.strftime('%Y-%m-%d')
                kwargs = dict()
                results=list()
                mylist=list()
                result = defaultdict(int)
                
                data=cd.get_cost_and_usage(TimePeriod={'Start': start, 'End':  end}, Granularity='DAILY', Metrics=['UnblendedCost'], GroupBy=[{'Type': 'DIMENSION', 'Key': 'LINKED_ACCOUNT'}, {'Type': 'DIMENSION', 'Key': 'SERVICE'}], **kwargs)
                
                results += data['ResultsByTime']
                
                for result_by_time in results:
                    for group in result_by_time['Groups']:
                        amount = group['Metrics']['UnblendedCost']['Amount']
                        unit = group['Metrics']['UnblendedCost']['Unit']
                        mylist.append([result_by_time['TimePeriod']['Start'],  amount])
                
                for fruit, value in mylist:
                    result[fruit] += float(value)
                result =  result.items()
                
                client.publish( PhoneNumber=m_number, Message= 'Personal2 '+str(result),
                   MessageAttributes={'AWS.SNS.SMS.SMSType': { 'DataType': 'String', 'StringValue': 'Transactional' } } )
                
                return (str(result))
                
      Environment:
        Variables:
          mobile_number: !FindInMap [myregion, key01, YourMobile]
      FunctionName: dailyCost1
      Handler: index.handler
      MemorySize: 128
      Role: !GetAtt 
        - GetCost
        - Arn
      Runtime: python2.7
      Timeout: '60'
    Type: 'AWS::Lambda::Function'

  GetCost:
    Properties:
      AssumeRolePolicyDocument:
        Statement:
          - Action:
              - 'sts:AssumeRole'
            Effect: Allow
            Principal:
              Service: lambda.amazonaws.com
      Policies:
        - PolicyDocument:
            Statement:
              - Action: '*'
                Effect: Allow
                Resource: '*'
                Sid: GenericAccess
            Version: 2012-10-17
          PolicyName: DailyCostPolicy
      RoleName: DailyCostRole1
    Type: 'AWS::IAM::Role'
  LambdaInvokePermission:
    Properties:
      Action: 'lambda:InvokeFunction'
      Principal: sns.amazonaws.com
      SourceArn: !GetAtt 
        - CronjobsScheduledRule
        - Arn
      FunctionName: !GetAtt 
        - DailyCostAlert
        - Arn
    Type: 'AWS::Lambda::Permission'
  CronjobsScheduledRule:
    Type: 'AWS::Events::Rule'
    Properties:
      Description: Scheduled Rule
      ScheduleExpression: cron(0 7 ? * * *)
      State: ENABLED
      Targets:
        - Arn: !GetAtt 
            - DailyCostAlert
            - Arn
          Id: TargetFunctionV1
