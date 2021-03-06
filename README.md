# cloudformation
Linux EC2 Instance on SPOT

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=linux&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/LinuxInstance.template">
 <img src="cls.png" width="144" height="27" />
</a>

<hr>

Windows EC2 Instance on SPOT

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=windows&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/windows.template-u6.txt">
 <img src="cls.png" width="144" height="27" />
</a>

<hr>

Create Restricted User

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=restricteduser&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/restricted_user.yaml">
 <img src="cls.png" width="144" height="27" />
</a>
 
<hr>

Daily Cost alert

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=costalert&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/daily_cost.yaml">
 <img src="cls.png" width="144" height="27" />
</a>

<hr>

Audit trail using Elastic

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=audit&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/audit_trail_combined9.yaml">
 <img src="cls.png" width="144" height="27" />
</a>

Visualising AWS CloudTrail Logs using EKK stack

https://blog.powerupcloud.com/visualizing-aws-cloudtrail-logs-using-elk-stack-e3d3b399af43

https://arkadiyt.com/2019/11/12/detecting-manual-aws-console-actions/?ck_subscriber_id=521868220

Medium Article link: https://medium.com/@shantanuo/cloudfromation-template-for-visualising-aws-cloudtrail-logs-ae700ac908bb

<hr>

Athena Queries

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=athena&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/athena_saved_query_blog_partition_parquet3.yaml">
 <img src="cls.png" width="144" height="27" />
</a>
 
Queries collected from these sites:

https://aws.amazon.com/blogs/big-data/analyzing-data-in-s3-using-amazon-athena/

https://aws.amazon.com/blogs/big-data/extract-transform-and-load-data-into-s3-data-lake-using-ctas-and-insert-into-statements-in-amazon-athena/

https://aws.amazon.com/premiumsupport/knowledge-center/set-file-number-size-ctas-athena/

https://docs.aws.amazon.com/athena/latest/ug/getting-started.html

<hr>

Submit Job to Batch 

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=submitjob&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/submit_job.yaml">
 <img src="cls.png" width="144" height="27" />
</a>

Create compute environment, set a queue and also add a daily cron to run any docker image with given parameters.

<hr>

Backup MySQL database

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=mysqltos3&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/dms.yml">
 <img src="cls.png" width="144" height="27" />
</a>

Export MySQL tables to S3 in CSV format 

Medium article link: https://medium.com/@shantanuo/change-data-capture-using-dms-201ccae2bc14

<hr>

Delete current stack after 5 minutes

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=deletecurrent&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/delete_after_5m.template">
 <img src="cls.png" width="144" height="27" />
</a>

Scheduling automatic deletion of AWS CloudFormation stacks

https://aws.amazon.com/blogs/infrastructure-and-automation/scheduling-automatic-deletion-of-aws-cloudformation-stacks/


<hr>

eye of customer

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=eyeofcustomer&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/ai-driven-social-media-dashboard-updated.template">
 <img src="cls.png" width="144" height="27" />
</a>

This template is based on this article:

https://aws.amazon.com/blogs/machine-learning/exploring-images-on-social-media-using-amazon-rekognition-and-amazon-athena/

Add a Lambda Trigger and start node service as explained here...

https://aws.amazon.com/blogs/machine-learning/build-a-social-media-dashboard-using-machine-learning-and-bi-services/

If you need a secure elastic service:

https://github.com/aws-samples/amazon-textract-comprehend-OCRimage-search-and-analyze

More advance features including Rekognition:

https://aws.amazon.com/blogs/compute/creating-a-searchable-enterprise-document-repository/

<hr>

emailThis

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=emailthis&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/furl.yaml.txt">
 <img src="cls.png" width="144" height="27" />
</a>

service similar to emailthis.me using mailgun.com api.

Medium article link: https://medium.com/@shantanuo/emailthis-bookmark-using-serverless-api-40146c35df07

<hr>

Glue Crwaler

<a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=myglue&templateURL=https://datameetgeobk.s3.amazonaws.com/cftemplates/glue_crawler.yml">
 <img src="cls.png" width="144" height="27" />
</a>

Submit the path of S3 file and it will create athena table.


