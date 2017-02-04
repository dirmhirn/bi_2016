SELECT COUNT(*)
FROM movies
WHERE array_contains(split(genres,'\\|'), 'Film-Noir');


hive> SELECT COUNT(*) FROM movies WHERE array_contains(split(genres,'\\|'), 'Film-Noir');
Query ID = cloudera_20170203035858_3a6dc159-8218-4476-a08a-e3d9f45a1bf6
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0004, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0004/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0004
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2017-02-03 03:58:47,611 Stage-1 map = 0%,  reduce = 0%
2017-02-03 03:58:54,905 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 3.85 sec
2017-02-03 03:59:01,161 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 5.59 sec
MapReduce Total cumulative CPU time: 5 seconds 590 msec
Ended Job = job_1486054229855_0004
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 5.59 sec   HDFS Read: 1404944 HDFS Write: 4 SUCCESS
Total MapReduce CPU Time Spent: 5 seconds 590 msec
OK
330
Time taken: 21.313 seconds, Fetched: 1 row(s)


EXPLAIN:
STAGE DEPENDENCIES:
  Stage-1 is a root stage
  Stage-0 depends on stages: Stage-1

STAGE PLANS:
  Stage: Stage-1
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: movies
            Statistics: Num rows: 13975 Data size: 1397520 Basic stats: COMPLETE Column stats: NONE
            Filter Operator
              predicate: array_contains(split(genres, '\|'), 'Film-Noir') (type: boolean)
              Statistics: Num rows: 6987 Data size: 698709 Basic stats: COMPLETE Column stats: NONE
              Select Operator
                Statistics: Num rows: 6987 Data size: 698709 Basic stats: COMPLETE Column stats: NONE
                Group By Operator
                  aggregations: count()
                  mode: hash
                  outputColumnNames: _col0
                  Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
                  Reduce Output Operator
                    sort order: 
                    Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
                    value expressions: _col0 (type: bigint)
      Reduce Operator Tree:
        Group By Operator
          aggregations: count(VALUE._col0)
          mode: mergepartial
          outputColumnNames: _col0
          Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
          File Output Operator
            compressed: false
            Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: NONE
            table:
                input format: org.apache.hadoop.mapred.TextInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-0
    Fetch Operator
      limit: -1
      Processor Tree:
        ListSink
