SELECT title
FROM 
  (SELECT title,
         count (tag) AS tag_count
  FROM movies
  LEFT JOIN tags
      ON (movies.movieId = tags.movieId)
  WHERE tag = 'mars'
  GROUP BY  title
  ORDER BY  tag_count DESC LIMIT 15) t;


hive> SELECT title FROM (SELECT title, count (tag) AS tag_count FROM movies left join tags ON (movies.movieId = tags.movieId) WHERE tag = 'mars' GROUP BY title ORDER BY tag_count DESC LIMIT 15) t;
Query ID = cloudera_20170203045252_5c10cda1-3dd2-4601-9957-9efad0931b37
Total jobs = 4
Stage-7 is selected by condition resolver.
Stage-1 is filtered out by condition resolver.
Execution log at: /tmp/cloudera/cloudera_20170203045252_5c10cda1-3dd2-4601-9957-9efad0931b37.log
2017-02-03 04:52:18	Starting to launch local task to process map join;	maximum memory = 932184064
2017-02-03 04:52:20	Dump the side-table for tag: 1 with group count: 19545 into file: file:/tmp/cloudera/d262be43-1556-436e-8cc2-4389bcc89f49/hive_2017-02-03_04-52-14_218_4369672908772249664-1/-local-10005/HashTable-Stage-5/MapJoin-mapfile121--.hashtable
2017-02-03 04:52:21	Uploaded 1 File to: file:/tmp/cloudera/d262be43-1556-436e-8cc2-4389bcc89f49/hive_2017-02-03_04-52-14_218_4369672908772249664-1/-local-10005/HashTable-Stage-5/MapJoin-mapfile121--.hashtable (8397615 bytes)
2017-02-03 04:52:21	End of local task; Time Taken: 3.134 sec.
Execution completed successfully
MapredLocal task succeeded
Launching Job 2 out of 4
Number of reduce tasks is set to 0 since there's no reduce operator
Starting Job = job_1486054229855_0036, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0036/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0036
Hadoop job information for Stage-5: number of mappers: 1; number of reducers: 0
2017-02-03 04:52:28,079 Stage-5 map = 0%,  reduce = 0%
2017-02-03 04:52:36,388 Stage-5 map = 100%,  reduce = 0%, Cumulative CPU 5.19 sec
MapReduce Total cumulative CPU time: 5 seconds 190 msec
Ended Job = job_1486054229855_0036
Launching Job 3 out of 4
Number of reduce tasks not specified. Defaulting to jobconf value of: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0037, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0037/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0037
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2017-02-03 04:52:43,945 Stage-2 map = 0%,  reduce = 0%
2017-02-03 04:52:49,147 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 1.01 sec
2017-02-03 04:52:55,415 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 2.51 sec
MapReduce Total cumulative CPU time: 2 seconds 510 msec
Ended Job = job_1486054229855_0037
Launching Job 4 out of 4
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0038, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0038/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0038
Hadoop job information for Stage-3: number of mappers: 1; number of reducers: 1
2017-02-03 04:53:02,143 Stage-3 map = 0%,  reduce = 0%
2017-02-03 04:53:08,393 Stage-3 map = 100%,  reduce = 0%, Cumulative CPU 1.25 sec
2017-02-03 04:53:14,631 Stage-3 map = 100%,  reduce = 100%, Cumulative CPU 2.96 sec
MapReduce Total cumulative CPU time: 2 seconds 960 msec
Ended Job = job_1486054229855_0038
MapReduce Jobs Launched: 
Stage-Stage-5: Map: 1   Cumulative CPU: 5.19 sec   HDFS Read: 1404133 HDFS Write: 873 SUCCESS
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 2.51 sec   HDFS Read: 5138 HDFS Write: 873 SUCCESS
Stage-Stage-3: Map: 1  Reduce: 1   Cumulative CPU: 2.96 sec   HDFS Read: 5555 HDFS Write: 353 SUCCESS
Total MapReduce CPU Time Spent: 10 seconds 660 msec
OK
Mars Attacks! (1996)
War of the Worlds, The (1953)
Total Recall (2012)
Total Recall (1990)
Capricorn One (1978)
Martian Child (2007)
It Came from Outer Space (1953)
Day the Earth Stood Still, The (1951)
Mission to Mars (2000)
6th Day, The (2000)
RocketMan (a.k.a. Rocket Man) (1997)
Destination Moon (1950)
Red Planet (2000)
Impostor (2002)
Doom (2005)
Time taken: 61.51 seconds, Fetched: 15 row(s)


EXPLAIN:
STAGE DEPENDENCIES:
  Stage-6 is a root stage , consists of Stage-7, Stage-1
  Stage-7 has a backup stage: Stage-1
  Stage-5 depends on stages: Stage-7
  Stage-2 depends on stages: Stage-1, Stage-5
  Stage-3 depends on stages: Stage-2
  Stage-1
  Stage-0 depends on stages: Stage-3

STAGE PLANS:
  Stage: Stage-6
    Conditional Operator

  Stage: Stage-7
    Map Reduce Local Work
      Alias -> Map Local Tables:
        t:tags 
          Fetch Operator
            limit: -1
      Alias -> Map Local Operator Tree:
        t:tags 
          TableScan
            alias: tags
            Statistics: Num rows: 159653 Data size: 16603966 Basic stats: COMPLETE Column stats: NONE
            HashTable Sink Operator
              keys:
                0 UDFToDouble(movieid) (type: double)
                1 UDFToDouble(movieid) (type: double)

  Stage: Stage-5
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: movies
            Statistics: Num rows: 6987 Data size: 1397520 Basic stats: COMPLETE Column stats: NONE
            Map Join Operator
              condition map:
                   Left Outer Join0 to 1
              keys:
                0 UDFToDouble(movieid) (type: double)
                1 UDFToDouble(movieid) (type: double)
              outputColumnNames: _col1, _col8
              Statistics: Num rows: 175618 Data size: 18264362 Basic stats: COMPLETE Column stats: NONE
              Filter Operator
                predicate: (_col8 = 'mars') (type: boolean)
                Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
                Select Operator
                  expressions: _col1 (type: string), 'mars' (type: string)
                  outputColumnNames: _col1, _col8
                  Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
                  Group By Operator
                    aggregations: count(_col8)
                    keys: _col1 (type: string)
                    mode: hash
                    outputColumnNames: _col0, _col1
                    Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
                    File Output Operator
                      compressed: false
                      table:
                          input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                          output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                          serde: org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe
      Local Work:
        Map Reduce Local Work

  Stage: Stage-2
    Map Reduce
      Map Operator Tree:
          TableScan
            Reduce Output Operator
              key expressions: _col0 (type: string)
              sort order: +
              Map-reduce partition columns: _col0 (type: string)
              Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col1 (type: bigint)
      Reduce Operator Tree:
        Group By Operator
          aggregations: count(VALUE._col0)
          keys: KEY._col0 (type: string)
          mode: mergepartial
          outputColumnNames: _col0, _col1
          Statistics: Num rows: 43904 Data size: 4566038 Basic stats: COMPLETE Column stats: NONE
          File Output Operator
            compressed: false
            table:
                input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe

  Stage: Stage-3
    Map Reduce
      Map Operator Tree:
          TableScan
            Reduce Output Operator
              key expressions: _col1 (type: bigint)
              sort order: -
              Statistics: Num rows: 43904 Data size: 4566038 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col0 (type: string)
      Reduce Operator Tree:
        Select Operator
          expressions: VALUE._col0 (type: string)
          outputColumnNames: _col0
          Statistics: Num rows: 43904 Data size: 4566038 Basic stats: COMPLETE Column stats: NONE
          Limit
            Number of rows: 15
            Statistics: Num rows: 15 Data size: 1560 Basic stats: COMPLETE Column stats: NONE
            File Output Operator
              compressed: false
              Statistics: Num rows: 15 Data size: 1560 Basic stats: COMPLETE Column stats: NONE
              table:
                  input format: org.apache.hadoop.mapred.TextInputFormat
                  output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                  serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-1
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: movies
            Statistics: Num rows: 6987 Data size: 1397520 Basic stats: COMPLETE Column stats: NONE
            Reduce Output Operator
              key expressions: UDFToDouble(movieid) (type: double)
              sort order: +
              Map-reduce partition columns: UDFToDouble(movieid) (type: double)
              Statistics: Num rows: 6987 Data size: 1397520 Basic stats: COMPLETE Column stats: NONE
              value expressions: title (type: string)
          TableScan
            alias: tags
            Statistics: Num rows: 159653 Data size: 16603966 Basic stats: COMPLETE Column stats: NONE
            Reduce Output Operator
              key expressions: UDFToDouble(movieid) (type: double)
              sort order: +
              Map-reduce partition columns: UDFToDouble(movieid) (type: double)
              Statistics: Num rows: 159653 Data size: 16603966 Basic stats: COMPLETE Column stats: NONE
              value expressions: tag (type: string)
      Reduce Operator Tree:
        Join Operator
          condition map:
               Left Outer Join0 to 1
          keys:
            0 UDFToDouble(movieid) (type: double)
            1 UDFToDouble(movieid) (type: double)
          outputColumnNames: _col1, _col8
          Statistics: Num rows: 175618 Data size: 18264362 Basic stats: COMPLETE Column stats: NONE
          Filter Operator
            predicate: (_col8 = 'mars') (type: boolean)
            Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
            Select Operator
              expressions: _col1 (type: string), 'mars' (type: string)
              outputColumnNames: _col1, _col8
              Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
              Group By Operator
                aggregations: count(_col8)
                keys: _col1 (type: string)
                mode: hash
                outputColumnNames: _col0, _col1
                Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
                File Output Operator
                  compressed: false
                  table:
                      input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                      output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                      serde: org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe

  Stage: Stage-0
    Fetch Operator
      limit: -1
      Processor Tree:
