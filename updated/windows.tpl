Resources:
  MySpotFleet:
    Type: 'AWS::EC2::SpotFleet'
    Properties:
      SpotFleetRequestConfigData:
        IamFleetRole: 'arn:aws:iam::302378362623:role/aws-ec2-spot-fleet-tagging-role'
        AllocationStrategy: lowestPrice
        TargetCapacity: 1
        LaunchSpecifications:
          - ImageId: ami-0204606704df03e7e
            InstanceType: t2.small
            NetworkInterfaces:
              - DeviceIndex: 0
                SubnetId: subnet-0779228a559630aee
                Groups:
                  - sg-0ffdbbc6237ba1242
                AssociatePublicIpAddress: true
            KeyName: dec15a
            TagSpecifications:
              - ResourceType: instance
                Tags:
                  - Key: Name
                    Value: Game of Life Test Instance
        Type: maintain
