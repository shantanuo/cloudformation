{
  "Resources": {
  "createTableOriginalCsv": {
      "Type": "AWS::Athena::NamedQuery",
      "Properties": {
        "Database": "default",
        "Description": "First query to create table based on AWS bucket data",
        "Name": "Blog1CreateTableOriginalCsv",
        "QueryString": "CREATE EXTERNAL TABLE `default`.`original_csv`
(`id` string, 
  `date` string, 
  `element` string, 
  `datavalue` bigint, 
  `mflag` string, 
  `qflag` string, 
  `sflag` string, 
  `obstime` bigint)
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://aws-bigdata-blog/artifacts/athena-ctas-insert-into-blog/' "}
},

   "createTableASParquetPartioned": {
      "Type": "AWS::Athena::NamedQuery",
      "Properties": {
        "Database": "default",
        "Description": "Create table as parquet partitioned",
        "Name": "Blog2createTableAS",
        "QueryString": "CREATE table new_parquet11
WITH (format='PARQUET', 
parquet_compression='SNAPPY', 
partitioned_by=array['year'], 
external_location = 's3://athenadata162a/optimized-data11/') 
AS SELECT id, date, element, datavalue, mflag, qflag, sflag, obstime, substr(\"date\",1,4) AS year
FROM original_csv WHERE cast(substr(\"date\",1,4) AS bigint) >= 2015 AND cast(substr(\"date\",1,4) AS bigint) <= 2019"
      }
    },

   "insertParquet": {
      "Type": "AWS::Athena::NamedQuery",
      "Properties": {
        "Database": "default",
        "Description": "insert data into parquet table",
        "Name": "Blog3insertParquet",
        "QueryString": "INSERT INTO new_parquet11
 SELECT id, date, element, datavalue, mflag, qflag, sflag, obstime, substr(\"date\",1,4) AS year
FROM original_csv WHERE cast(substr(\"date\",1,4) AS bigint) < 2015"
      }
    },

   "insertParquetAddPartition": {
      "Type": "AWS::Athena::NamedQuery",
      "Properties": {
        "Database": "default",
        "Description": "insert data into parquet and add partitions",
        "Name": "Blog4insertParquetAddPartion",
        "QueryString": "INSERT INTO new_parquet11
 SELECT id, date, element, datavalue, mflag, qflag, sflag, obstime, substr(\"date\",1,4) AS year
FROM original_csv WHERE cast(substr(\"date\",1,4) AS bigint) = 2020"
      }
    },

   "selectOriginalCsv": {
      "Type": "AWS::Athena::NamedQuery",
      "Properties": {
        "Database": "default",
        "Description": "original_csv data selected",
        "Name": "Blog5selectOrigialCsv",
        "QueryString": "SELECT substr(\"date\",1,4) as year, COUNT(DISTINCT id) 
FROM original_csv GROUP BY 1 ORDER BY 1 DESC"
      }
    },

   "selectNewParquet": {
      "Type": "AWS::Athena::NamedQuery",
      "Properties": {
        "Database": "default",
        "Description": "new_parquet data selected",
        "Name": "Blog6selectNewParquet",
        "QueryString": "SELECT year, COUNT(DISTINCT id) 
FROM new_parquet11 GROUP BY  1 ORDER BY 1 DESC"
      }
    },

   "selectOriginalCsvGroupElement": {
      "Type": "AWS::Athena::NamedQuery",
      "Properties": {
        "Database": "default",
        "Description": "orignal_csv data grouped",
        "Name": "MostExpensiveWorkflow",
        "QueryString": "SELECT element, round(avg(CAST(datavalue AS real)/10),2) AS value
FROM original_csv WHERE element IN ('TMIN', 'TMAX', 'PRCP') AND substr(`date`,1,4) = '2018' GROUP BY  1"
      }
    },

   "selectParquetGroupElement": {
      "Type": "AWS::Athena::NamedQuery",
      "Properties": {
        "Database": "default",
        "Description": "new_parquet data grouped",
        "Name": "MostExpensiveWorkflow",
        "QueryString": "SELECT element, round(avg(CAST(datavalue AS real)/10),2) AS value
FROM new_parquet11 WHERE element IN ('TMIN', 'TMAX', 'PRCP') and year = '2018' GROUP BY  1"
      }
    }

  }
}
