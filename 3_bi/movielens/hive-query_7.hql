SELECT title
FROM 
  (SELECT title,
         t.rating_count
  FROM 
    (SELECT title,
         avg(rating) AS rating_av,
         count(rating) AS rating_count
    FROM movies
    LEFT JOIN ratings
        ON (movies.movieId = ratings.movieId)
    GROUP BY  title
    ORDER BY  rating_av DESC) t
    ORDER BY  t.rating_count desc) f LIMIT 10;


hive> SELECT f.title FROM (SELECT title, t.rating_count FROM (SELECT title, avg(rating) AS rating_av, count(rating) AS rating_count FROM movies left join ratings ON (movies.movieId = ratings.movieId) GROUP BY title ORDER BY rating_av DESC) t ORDER BY t.rating_count desc) f LIMIT 10;
Query ID = cloudera_20170203095656_d4adf288-4146-4cef-af09-26029c09cc4a
Total jobs = 4
Stage-1 is selected by condition resolver.
Launching Job 1 out of 4
Number of reduce tasks not specified. Estimated from input data size: 3
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0072, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0072/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0072
Hadoop job information for Stage-1: number of mappers: 3; number of reducers: 3
2017-02-03 09:56:21,561 Stage-1 map = 0%,  reduce = 0%
2017-02-03 09:56:34,245 Stage-1 map = 33%,  reduce = 0%, Cumulative CPU 9.39 sec
2017-02-03 09:56:54,864 Stage-1 map = 33%,  reduce = 7%, Cumulative CPU 37.8 sec
2017-02-03 09:56:55,919 Stage-1 map = 33%,  reduce = 11%, Cumulative CPU 41.23 sec
2017-02-03 09:57:02,328 Stage-1 map = 44%,  reduce = 11%, Cumulative CPU 52.72 sec
2017-02-03 09:57:04,458 Stage-1 map = 56%,  reduce = 11%, Cumulative CPU 55.64 sec
2017-02-03 09:57:23,749 Stage-1 map = 67%,  reduce = 11%, Cumulative CPU 93.7 sec
2017-02-03 09:57:25,864 Stage-1 map = 78%,  reduce = 11%, Cumulative CPU 96.27 sec
2017-02-03 09:57:26,957 Stage-1 map = 80%,  reduce = 11%, Cumulative CPU 99.28 sec
2017-02-03 09:57:29,077 Stage-1 map = 82%,  reduce = 11%, Cumulative CPU 102.05 sec
2017-02-03 09:57:30,179 Stage-1 map = 84%,  reduce = 11%, Cumulative CPU 104.6 sec
2017-02-03 09:57:31,226 Stage-1 map = 86%,  reduce = 11%, Cumulative CPU 106.97 sec
2017-02-03 09:57:33,359 Stage-1 map = 88%,  reduce = 11%, Cumulative CPU 109.4 sec
2017-02-03 09:57:34,415 Stage-1 map = 90%,  reduce = 11%, Cumulative CPU 112.06 sec
2017-02-03 09:57:35,471 Stage-1 map = 93%,  reduce = 11%, Cumulative CPU 114.75 sec
2017-02-03 09:57:37,604 Stage-1 map = 95%,  reduce = 11%, Cumulative CPU 117.05 sec
2017-02-03 09:57:38,635 Stage-1 map = 97%,  reduce = 11%, Cumulative CPU 119.45 sec
2017-02-03 09:57:40,720 Stage-1 map = 99%,  reduce = 11%, Cumulative CPU 122.07 sec
2017-02-03 09:57:41,757 Stage-1 map = 99%,  reduce = 19%, Cumulative CPU 122.58 sec
2017-02-03 09:57:42,821 Stage-1 map = 100%,  reduce = 19%, Cumulative CPU 123.51 sec
2017-02-03 09:57:43,903 Stage-1 map = 100%,  reduce = 26%, Cumulative CPU 124.36 sec
2017-02-03 09:57:44,950 Stage-1 map = 100%,  reduce = 38%, Cumulative CPU 127.37 sec
2017-02-03 09:57:47,055 Stage-1 map = 100%,  reduce = 52%, Cumulative CPU 133.32 sec
2017-02-03 09:57:48,112 Stage-1 map = 100%,  reduce = 60%, Cumulative CPU 136.25 sec
2017-02-03 09:57:50,285 Stage-1 map = 100%,  reduce = 66%, Cumulative CPU 142.01 sec
2017-02-03 09:57:51,340 Stage-1 map = 100%,  reduce = 67%, Cumulative CPU 145.02 sec
2017-02-03 09:57:53,457 Stage-1 map = 100%,  reduce = 70%, Cumulative CPU 151.07 sec
2017-02-03 09:57:54,516 Stage-1 map = 100%,  reduce = 72%, Cumulative CPU 153.83 sec
2017-02-03 09:57:55,633 Stage-1 map = 100%,  reduce = 74%, Cumulative CPU 156.8 sec
2017-02-03 09:57:56,710 Stage-1 map = 100%,  reduce = 78%, Cumulative CPU 159.75 sec
2017-02-03 09:57:58,814 Stage-1 map = 100%,  reduce = 80%, Cumulative CPU 165.57 sec
2017-02-03 09:57:59,867 Stage-1 map = 100%,  reduce = 85%, Cumulative CPU 171.45 sec
2017-02-03 09:58:01,974 Stage-1 map = 100%,  reduce = 87%, Cumulative CPU 174.33 sec
2017-02-03 09:58:03,024 Stage-1 map = 100%,  reduce = 91%, Cumulative CPU 180.22 sec
2017-02-03 09:58:05,145 Stage-1 map = 100%,  reduce = 93%, Cumulative CPU 183.13 sec
2017-02-03 09:58:06,200 Stage-1 map = 100%,  reduce = 97%, Cumulative CPU 188.98 sec
2017-02-03 09:58:07,265 Stage-1 map = 100%,  reduce = 98%, Cumulative CPU 191.99 sec
2017-02-03 09:58:08,324 Stage-1 map = 100%,  reduce = 99%, Cumulative CPU 194.73 sec
2017-02-03 09:58:09,357 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 196.05 sec
MapReduce Total cumulative CPU time: 3 minutes 16 seconds 50 msec
Ended Job = job_1486054229855_0072
Launching Job 2 out of 4
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0073, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0073/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0073
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2017-02-03 09:58:17,019 Stage-2 map = 0%,  reduce = 0%
2017-02-03 09:58:24,310 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 4.55 sec
2017-02-03 09:58:32,662 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 9.09 sec
MapReduce Total cumulative CPU time: 9 seconds 90 msec
Ended Job = job_1486054229855_0073
Launching Job 3 out of 4
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0074, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0074/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0074
Hadoop job information for Stage-3: number of mappers: 1; number of reducers: 1
2017-02-03 09:58:39,563 Stage-3 map = 0%,  reduce = 0%
2017-02-03 09:58:46,823 Stage-3 map = 100%,  reduce = 0%, Cumulative CPU 4.89 sec
2017-02-03 09:58:55,148 Stage-3 map = 100%,  reduce = 100%, Cumulative CPU 9.0 sec
MapReduce Total cumulative CPU time: 9 seconds 0 msec
Ended Job = job_1486054229855_0074
Launching Job 4 out of 4
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0075, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0075/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0075
Hadoop job information for Stage-4: number of mappers: 1; number of reducers: 1
2017-02-03 09:59:02,221 Stage-4 map = 0%,  reduce = 0%
2017-02-03 09:59:09,509 Stage-4 map = 100%,  reduce = 0%, Cumulative CPU 4.12 sec
2017-02-03 09:59:16,781 Stage-4 map = 100%,  reduce = 100%, Cumulative CPU 6.4 sec
MapReduce Total cumulative CPU time: 6 seconds 400 msec
Ended Job = job_1486054229855_0075
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 3  Reduce: 3   Cumulative CPU: 196.05 sec   HDFS Read: 534878711 HDFS Write: 1586436 SUCCESS
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 9.09 sec   HDFS Read: 1592496 HDFS Write: 1423262 SUCCESS
Stage-Stage-3: Map: 1  Reduce: 1   Cumulative CPU: 9.0 sec   HDFS Read: 1427803 HDFS Write: 1307220 SUCCESS
Stage-Stage-4: Map: 1  Reduce: 1   Cumulative CPU: 6.4 sec   HDFS Read: 1311730 HDFS Write: 264 SUCCESS
Total MapReduce CPU Time Spent: 3 minutes 40 seconds 540 msec
OK
Pulp Fiction (1994)
Forrest Gump (1994)
Shawshank Redemption, The (1994)
Silence of the Lambs, The (1991)
Jurassic Park (1993)
Star Wars: Episode IV - A New Hope (1977)
Braveheart (1995)
Terminator 2: Judgment Day (1991)
Matrix, The (1999)
Schindler's List (1993)
Time taken: 182.445 seconds, Fetched: 10 row(s)

EXPLAIN:
STAGE DEPENDENCIES:
  Stage-7 is a root stage , consists of Stage-1
  Stage-1
  Stage-2 depends on stages: Stage-1
  Stage-3 depends on stages: Stage-2
  Stage-4 depends on stages: Stage-3
  Stage-0 depends on stages: Stage-4

STAGE PLANS:
  Stage: Stage-7
    Conditional Operator

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
            alias: ratings
            Statistics: Num rows: 4598658 Data size: 533444384 Basic stats: COMPLETE Column stats: NONE
            Reduce Output Operator
              key expressions: UDFToDouble(movieid) (type: double)
              sort order: +
              Map-reduce partition columns: UDFToDouble(movieid) (type: double)
              Statistics: Num rows: 4598658 Data size: 533444384 Basic stats: COMPLETE Column stats: NONE
              value expressions: rating (type: decimal(2,1))
      Reduce Operator Tree:
        Join Operator
          condition map:
               Left Outer Join0 to 1
          keys:
            0 UDFToDouble(movieid) (type: double)
            1 UDFToDouble(movieid) (type: double)
          outputColumnNames: _col1, _col8
          Statistics: Num rows: 5058523 Data size: 586788835 Basic stats: COMPLETE Column stats: NONE
          Group By Operator
            aggregations: avg(_col8), count(_col8)
            keys: _col1 (type: string)
            mode: hash
            outputColumnNames: _col0, _col1, _col2
            Statistics: Num rows: 5058523 Data size: 586788835 Basic stats: COMPLETE Column stats: NONE
            File Output Operator
              compressed: false
              table:
                  input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                  output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                  serde: org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe

  Stage: Stage-2
    Map Reduce
      Map Operator Tree:
          TableScan
            Reduce Output Operator
              key expressions: _col0 (type: string)
              sort order: +
              Map-reduce partition columns: _col0 (type: string)
              Statistics: Num rows: 5058523 Data size: 586788835 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col1 (type: struct<count:bigint,sum:decimal(12,1),input:decimal(2,1)>), _col2 (type: bigint)
      Reduce Operator Tree:
        Group By Operator
          aggregations: avg(VALUE._col0), count(VALUE._col1)
          keys: KEY._col0 (type: string)
          mode: mergepartial
          outputColumnNames: _col0, _col1, _col2
          Statistics: Num rows: 2529261 Data size: 293394359 Basic stats: COMPLETE Column stats: NONE
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
              key expressions: _col1 (type: decimal(6,5))
              sort order: -
              Statistics: Num rows: 2529261 Data size: 293394359 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col0 (type: string), _col2 (type: bigint)
      Reduce Operator Tree:
        Select Operator
          expressions: VALUE._col0 (type: string), VALUE._col1 (type: bigint)
          outputColumnNames: _col0, _col1
          Statistics: Num rows: 2529261 Data size: 293394359 Basic stats: COMPLETE Column stats: NONE
          File Output Operator
            compressed: false
            table:
                input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe

  Stage: Stage-4
    Map Reduce
      Map Operator Tree:
          TableScan
            Reduce Output Operator
              key expressions: _col1 (type: bigint)
              sort order: -
              Statistics: Num rows: 2529261 Data size: 293394359 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col0 (type: string)
      Reduce Operator Tree:
        Select Operator
          expressions: VALUE._col0 (type: string)
          outputColumnNames: _col0
          Statistics: Num rows: 2529261 Data size: 293394359 Basic stats: COMPLETE Column stats: NONE
          Limit
            Number of rows: 10
            Statistics: Num rows: 10 Data size: 1160 Basic stats: COMPLETE Column stats: NONE
            File Output Operator
              compressed: false
              Statistics: Num rows: 10 Data size: 1160 Basic stats: COMPLETE Column stats: NONE
              table:
                  input format: org.apache.hadoop.mapred.TextInputFormat
                  output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                  serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-0
    Fetch Operator
      limit: 10
      Processor Tree:
        ListSink

