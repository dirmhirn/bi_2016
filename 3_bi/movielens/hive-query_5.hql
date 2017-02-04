SELECT title,
         count (tag) AS tag_count
FROM movies
LEFT JOIN tags
    ON (movies.movieId = tags.movieId)
GROUP BY  title
ORDER BY  tag_count DESC LIMIT 10;


hive> SELECT title, count (tag) AS tag_count FROM movies left join tags ON (movies.movieId = tags.movieId) WHGROUP BY title ORDER BY tag_count DESC LIMIT 10;
FAILED: ParseException line 1:101 missing EOF at 'WHGROUP' near ')'
hive> SELECT title, count (tag) AS tag_count FROM movies left join tags ON (movies.movieId = tags.movieId) GROUP BY title ORDER BY tag_count DESC LIMIT 10;
Query ID = cloudera_20170203050505_c77caac2-4869-482e-8b8d-dae7b695500a
Total jobs = 4
Stage-7 is selected by condition resolver.
Stage-1 is filtered out by condition resolver.
Execution log at: /tmp/cloudera/cloudera_20170203050505_c77caac2-4869-482e-8b8d-dae7b695500a.log
2017-02-03 05:05:38	Starting to launch local task to process map join;	maximum memory = 932184064
2017-02-03 05:05:40	Dump the side-table for tag: 1 with group count: 19545 into file: file:/tmp/cloudera/d262be43-1556-436e-8cc2-4389bcc89f49/hive_2017-02-03_05-05-34_005_1391349258983216116-1/-local-10005/HashTable-Stage-5/MapJoin-mapfile131--.hashtable
2017-02-03 05:05:41	Uploaded 1 File to: file:/tmp/cloudera/d262be43-1556-436e-8cc2-4389bcc89f49/hive_2017-02-03_05-05-34_005_1391349258983216116-1/-local-10005/HashTable-Stage-5/MapJoin-mapfile131--.hashtable (8397615 bytes)
2017-02-03 05:05:41	End of local task; Time Taken: 3.154 sec.
Execution completed successfully
MapredLocal task succeeded
Launching Job 2 out of 4
Number of reduce tasks is set to 0 since there's no reduce operator
Starting Job = job_1486054229855_0039, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0039/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0039
Hadoop job information for Stage-5: number of mappers: 1; number of reducers: 0
2017-02-03 05:05:48,091 Stage-5 map = 0%,  reduce = 0%
2017-02-03 05:05:56,423 Stage-5 map = 100%,  reduce = 0%, Cumulative CPU 5.19 sec
MapReduce Total cumulative CPU time: 5 seconds 190 msec
Ended Job = job_1486054229855_0039
Launching Job 3 out of 4
Number of reduce tasks not specified. Defaulting to jobconf value of: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0040, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0040/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0040
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2017-02-03 05:06:04,038 Stage-2 map = 0%,  reduce = 0%
2017-02-03 05:06:10,278 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 3.71 sec
2017-02-03 05:06:17,578 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 7.31 sec
MapReduce Total cumulative CPU time: 7 seconds 310 msec
Ended Job = job_1486054229855_0040
Launching Job 4 out of 4
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0041, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0041/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0041
Hadoop job information for Stage-3: number of mappers: 1; number of reducers: 1
2017-02-03 05:06:25,202 Stage-3 map = 0%,  reduce = 0%
2017-02-03 05:06:31,555 Stage-3 map = 100%,  reduce = 0%, Cumulative CPU 3.91 sec
2017-02-03 05:06:39,973 Stage-3 map = 100%,  reduce = 100%, Cumulative CPU 6.35 sec
MapReduce Total cumulative CPU time: 6 seconds 350 msec
Ended Job = job_1486054229855_0041
MapReduce Jobs Launched: 
Stage-Stage-5: Map: 1   Cumulative CPU: 5.19 sec   HDFS Read: 1403314 HDFS Write: 1294150 SUCCESS
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 7.31 sec   HDFS Read: 1298415 HDFS Write: 1294150 SUCCESS
Stage-Stage-3: Map: 1  Reduce: 1   Cumulative CPU: 6.35 sec   HDFS Read: 1298867 HDFS Write: 283 SUCCESS
Total MapReduce CPU Time Spent: 18 seconds 850 msec
OK
Pulp Fiction (1994)	1994
Fight Club (1999)	1779
Inception (2010)	1552
Matrix, The (1999)	1430
Shawshank Redemption, The (1994)	1339
Eternal Sunshine of the Spotless Mind (2004)	1240
Donnie Darko (2001)	1177
Memento (2000)	1168
Silence of the Lambs, The (1991)	1100
Avatar (2009)	995
Time taken: 67.063 seconds, Fetched: 10 row(s)


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
        tags 
          Fetch Operator
            limit: -1
      Alias -> Map Local Operator Tree:
        tags 
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
              Group By Operator
                aggregations: count(_col8)
                keys: _col1 (type: string)
                mode: hash
                outputColumnNames: _col0, _col1
                Statistics: Num rows: 175618 Data size: 18264362 Basic stats: COMPLETE Column stats: NONE
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
              Statistics: Num rows: 175618 Data size: 18264362 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col1 (type: bigint)
      Reduce Operator Tree:
        Group By Operator
          aggregations: count(VALUE._col0)
          keys: KEY._col0 (type: string)
          mode: mergepartial
          outputColumnNames: _col0, _col1
          Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
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
              Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col0 (type: string)
      Reduce Operator Tree:
        Select Operator
          expressions: VALUE._col0 (type: string), KEY.reducesinkkey0 (type: bigint)
          outputColumnNames: _col0, _col1
          Statistics: Num rows: 87809 Data size: 9132181 Basic stats: COMPLETE Column stats: NONE
          Limit
            Number of rows: 10
            Statistics: Num rows: 10 Data size: 1040 Basic stats: COMPLETE Column stats: NONE
            File Output Operator
              compressed: false
              Statistics: Num rows: 10 Data size: 1040 Basic stats: COMPLETE Column stats: NONE
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
          Group By Operator
            aggregations: count(_col8)
            keys: _col1 (type: string)
            mode: hash
            outputColumnNames: _col0, _col1
            Statistics: Num rows: 175618 Data size: 18264362 Basic stats: COMPLETE Column stats: NONE
            File Output Operator
              compressed: false
              table:
                  input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                  output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                  serde: org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe

  Stage: Stage-0
    Fetch Operator
      limit: 10
      Processor Tree:
        ListSink
