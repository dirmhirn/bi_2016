SELECT tag
FROM 
  (SELECT tag,
         g.relevance
  FROM 
    (SELECT tagID,
         relevance
    FROM genome_scores
    WHERE movieId = 1) g
    LEFT JOIN genome_tags
        ON (genome_tags.tagId = g.tagId)
    ORDER BY  g.relevance DESC) f LIMIT 15;



various querries different speeds:

hive> SELECT tag, g.relevance FROM (SELECT tagID, relevance FROM genome_scores WHERE movieId = 1 ORDER BY relevance DESC) g LEFT JOIN genome_tags ON (genome_tags.tagId = g.tagId) LIMIT 10;
Query ID = cloudera_20170203104646_94b0a8f4-a648-4c80-a3a9-bbb1617dc12f
Total jobs = 2
Launching Job 1 out of 2
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0089, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0089/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0089
Hadoop job information for Stage-1: number of mappers: 2; number of reducers: 1
2017-02-03 10:46:35,230 Stage-1 map = 0%,  reduce = 0%
2017-02-03 10:46:45,717 Stage-1 map = 50%,  reduce = 0%, Cumulative CPU 3.65 sec
2017-02-03 10:46:46,749 Stage-1 map = 67%,  reduce = 0%, Cumulative CPU 10.25 sec
2017-02-03 10:46:47,781 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 11.04 sec
2017-02-03 10:46:51,941 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 13.11 sec
MapReduce Total cumulative CPU time: 13 seconds 110 msec
Ended Job = job_1486054229855_0089
Execution log at: /tmp/cloudera/cloudera_20170203104646_94b0a8f4-a648-4c80-a3a9-bbb1617dc12f.log
2017-02-03 10:46:57	Starting to launch local task to process map join;	maximum memory = 932184064
2017-02-03 10:46:58	Dump the side-table for tag: 1 with group count: 1128 into file: file:/tmp/cloudera/8563e79d-4896-4e3d-a9a0-858afc09fd5e/hive_2017-02-03_10-46-29_044_5939000562687796291-1/-local-10004/HashTable-Stage-4/MapJoin-mapfile131--.hashtable
2017-02-03 10:46:58	Uploaded 1 File to: file:/tmp/cloudera/8563e79d-4896-4e3d-a9a0-858afc09fd5e/hive_2017-02-03_10-46-29_044_5939000562687796291-1/-local-10004/HashTable-Stage-4/MapJoin-mapfile131--.hashtable (36170 bytes)
2017-02-03 10:46:58	End of local task; Time Taken: 1.068 sec.
Execution completed successfully
MapredLocal task succeeded
Launching Job 2 out of 2
Number of reduce tasks is set to 0 since there's no reduce operator
Starting Job = job_1486054229855_0090, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0090/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0090
Hadoop job information for Stage-4: number of mappers: 1; number of reducers: 0
2017-02-03 10:47:04,508 Stage-4 map = 0%,  reduce = 0%
2017-02-03 10:47:10,747 Stage-4 map = 100%,  reduce = 0%, Cumulative CPU 1.64 sec
MapReduce Total cumulative CPU time: 1 seconds 640 msec
Ended Job = job_1486054229855_0090
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 2  Reduce: 1   Cumulative CPU: 13.11 sec   HDFS Read: 323562547 HDFS Write: 31276 SUCCESS
Stage-Stage-4: Map: 1   Cumulative CPU: 1.64 sec   HDFS Read: 5943 HDFS Write: 216 SUCCESS
Total MapReduce CPU Time Spent: 14 seconds 750 msec
OK
toys	0.99925
computer animation	0.9984999999999999
pixar animation	0.996
kids and family	0.99075
animation	0.9857499999999999
kids	0.97925
pixar	0.96675
children	0.96425
cartoon	0.9564999999999999
imdb top 250	0.942
Time taken: 42.777 seconds, Fetched: 10 row(s)
hive> SELECT tag, g.relevance FROM (SELECT tagID, relevance FROM genome_scores WHERE movieId = 1) g LEFT JOIN genome_tags ON (genome_tags.tagId = g.tagId) ORDER BY g.relevance DESC LIMIT 10;
Query ID = cloudera_20170203104747_68fba81c-7c17-4a45-9477-e3077ddce441
Total jobs = 1
Execution log at: /tmp/cloudera/cloudera_20170203104747_68fba81c-7c17-4a45-9477-e3077ddce441.log
2017-02-03 10:47:22	Starting to launch local task to process map join;	maximum memory = 932184064
2017-02-03 10:47:23	Dump the side-table for tag: 1 with group count: 1128 into file: file:/tmp/cloudera/8563e79d-4896-4e3d-a9a0-858afc09fd5e/hive_2017-02-03_10-47-18_744_1410959694402253646-1/-local-10004/HashTable-Stage-2/MapJoin-mapfile141--.hashtable
2017-02-03 10:47:23	Uploaded 1 File to: file:/tmp/cloudera/8563e79d-4896-4e3d-a9a0-858afc09fd5e/hive_2017-02-03_10-47-18_744_1410959694402253646-1/-local-10004/HashTable-Stage-2/MapJoin-mapfile141--.hashtable (36170 bytes)
2017-02-03 10:47:23	End of local task; Time Taken: 1.032 sec.
Execution completed successfully
MapredLocal task succeeded
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0091, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0091/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0091
Hadoop job information for Stage-2: number of mappers: 2; number of reducers: 1
2017-02-03 10:47:31,791 Stage-2 map = 0%,  reduce = 0%
2017-02-03 10:47:41,249 Stage-2 map = 50%,  reduce = 0%, Cumulative CPU 3.54 sec
2017-02-03 10:47:43,304 Stage-2 map = 67%,  reduce = 0%, Cumulative CPU 10.16 sec
2017-02-03 10:47:44,337 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 11.12 sec
2017-02-03 10:47:48,477 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 12.94 sec
MapReduce Total cumulative CPU time: 12 seconds 940 msec
Ended Job = job_1486054229855_0091
MapReduce Jobs Launched: 
Stage-Stage-2: Map: 2  Reduce: 1   Cumulative CPU: 12.94 sec   HDFS Read: 323569797 HDFS Write: 216 SUCCESS
Total MapReduce CPU Time Spent: 12 seconds 940 msec
OK
toys	0.99925
computer animation	0.9984999999999999
pixar animation	0.996
kids and family	0.99075
animation	0.9857499999999999
kids	0.97925
pixar	0.96675
children	0.96425
cartoon	0.9564999999999999
imdb top 250	0.942
Time taken: 30.82 seconds, Fetched: 10 row(s)
hive> SELECT tag FROM (SELECT tag, g.relevance FROM (SELECT tagID, relevance FROM genome_scores WHERE movieId = 1) g LEFT JOIN genome_tags ON (genome_tags.tagId = g.tagId) ORDER BY g.relevance DESC) f LIMIT 15;
Query ID = cloudera_20170203104848_57da5bb1-8ac7-47c7-9ce8-861e61a96c58
Total jobs = 1
Execution log at: /tmp/cloudera/cloudera_20170203104848_57da5bb1-8ac7-47c7-9ce8-861e61a96c58.log
2017-02-03 10:48:39	Starting to launch local task to process map join;	maximum memory = 932184064
2017-02-03 10:48:40	Dump the side-table for tag: 1 with group count: 1128 into file: file:/tmp/cloudera/8563e79d-4896-4e3d-a9a0-858afc09fd5e/hive_2017-02-03_10-48-36_181_5551453526885901661-1/-local-10004/HashTable-Stage-2/MapJoin-mapfile151--.hashtable
2017-02-03 10:48:40	Uploaded 1 File to: file:/tmp/cloudera/8563e79d-4896-4e3d-a9a0-858afc09fd5e/hive_2017-02-03_10-48-36_181_5551453526885901661-1/-local-10004/HashTable-Stage-2/MapJoin-mapfile151--.hashtable (36170 bytes)
2017-02-03 10:48:40	End of local task; Time Taken: 1.045 sec.
Execution completed successfully
MapredLocal task succeeded
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0092, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0092/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0092
Hadoop job information for Stage-2: number of mappers: 2; number of reducers: 1
2017-02-03 10:48:49,956 Stage-2 map = 0%,  reduce = 0%
2017-02-03 10:49:00,341 Stage-2 map = 50%,  reduce = 0%, Cumulative CPU 3.64 sec
2017-02-03 10:49:01,371 Stage-2 map = 67%,  reduce = 0%, Cumulative CPU 10.03 sec
2017-02-03 10:49:02,423 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 11.02 sec
2017-02-03 10:49:06,593 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 12.78 sec
MapReduce Total cumulative CPU time: 12 seconds 780 msec
Ended Job = job_1486054229855_0092
MapReduce Jobs Launched: 
Stage-Stage-2: Map: 2  Reduce: 1   Cumulative CPU: 12.78 sec   HDFS Read: 323569733 HDFS Write: 173 SUCCESS
Total MapReduce CPU Time Spent: 12 seconds 780 msec
OK
toys
computer animation
pixar animation
kids and family
animation
kids
pixar
children
cartoon
imdb top 250
animated
childhood
great movie
disney animated feature
friendship
Time taken: 31.49 seconds, Fetched: 15 row(s)

EXPLAIN:
STAGE DEPENDENCIES:
  Stage-5 is a root stage
  Stage-2 depends on stages: Stage-5
  Stage-0 depends on stages: Stage-2

STAGE PLANS:
  Stage: Stage-5
    Map Reduce Local Work
      Alias -> Map Local Tables:
        f:genome_tags 
          Fetch Operator
            limit: -1
      Alias -> Map Local Operator Tree:
        f:genome_tags 
          TableScan
            alias: genome_tags
            Statistics: Num rows: 173 Data size: 18092 Basic stats: COMPLETE Column stats: NONE
            HashTable Sink Operator
              keys:
                0 _col0 (type: int)
                1 tagid (type: int)

  Stage: Stage-2
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: genome_scores
            Statistics: Num rows: 2696202 Data size: 323544352 Basic stats: COMPLETE Column stats: NONE
            Filter Operator
              predicate: (movieid = 1) (type: boolean)
              Statistics: Num rows: 1348101 Data size: 161772176 Basic stats: COMPLETE Column stats: NONE
              Select Operator
                expressions: tagid (type: int), relevance (type: decimal(25,24))
                outputColumnNames: _col0, _col1
                Statistics: Num rows: 1348101 Data size: 161772176 Basic stats: COMPLETE Column stats: NONE
                Map Join Operator
                  condition map:
                       Left Outer Join0 to 1
                  keys:
                    0 _col0 (type: int)
                    1 tagid (type: int)
                  outputColumnNames: _col1, _col3
                  Statistics: Num rows: 1482911 Data size: 177949397 Basic stats: COMPLETE Column stats: NONE
                  Select Operator
                    expressions: _col3 (type: string), _col1 (type: decimal(25,24))
                    outputColumnNames: _col0, _col1
                    Statistics: Num rows: 1482911 Data size: 177949397 Basic stats: COMPLETE Column stats: NONE
                    Reduce Output Operator
                      key expressions: _col1 (type: decimal(25,24))
                      sort order: -
                      Statistics: Num rows: 1482911 Data size: 177949397 Basic stats: COMPLETE Column stats: NONE
                      value expressions: _col0 (type: string)
      Local Work:
        Map Reduce Local Work
      Reduce Operator Tree:
        Select Operator
          expressions: VALUE._col0 (type: string)
          outputColumnNames: _col0
          Statistics: Num rows: 1482911 Data size: 177949397 Basic stats: COMPLETE Column stats: NONE
          Limit
            Number of rows: 15
            Statistics: Num rows: 15 Data size: 1800 Basic stats: COMPLETE Column stats: NONE
            File Output Operator
              compressed: false
              Statistics: Num rows: 15 Data size: 1800 Basic stats: COMPLETE Column stats: NONE
              table:
                  input format: org.apache.hadoop.mapred.TextInputFormat
                  output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                  serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-0
    Fetch Operator
      limit: 15
      Processor Tree:
        ListSink

