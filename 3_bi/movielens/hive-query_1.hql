SELECT COUNT(*)
FROM movies;


Query ID = cloudera_20170203032323_161d424a-f107-44ce-b29b-bdb18458e198
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0001, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0001/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0001
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2017-02-03 03:24:02,406 Stage-1 map = 0%,  reduce = 0%
2017-02-03 03:24:08,837 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 2.42 sec
2017-02-03 03:24:15,124 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 4.15 sec
MapReduce Total cumulative CPU time: 4 seconds 150 msec
Ended Job = job_1486054229855_0001
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 4.15 sec   HDFS Read: 1403984 HDFS Write: 6 SUCCESS
Total MapReduce CPU Time Spent: 4 seconds 150 msec
OK
27278
Time taken: 24.36 seconds, Fetched: 1 row(s)


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
            Statistics: Num rows: 1 Data size: 1397520 Basic stats: COMPLETE Column stats: COMPLETE
            Select Operator
              Statistics: Num rows: 1 Data size: 1397520 Basic stats: COMPLETE Column stats: COMPLETE
              Group By Operator
                aggregations: count()
                mode: hash
                outputColumnNames: _col0
                Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
                Reduce Output Operator
                  sort order: 
                  Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
                  value expressions: _col0 (type: bigint)
      Reduce Operator Tree:
        Group By Operator
          aggregations: count(VALUE._col0)
          mode: mergepartial
          outputColumnNames: _col0
          Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
          File Output Operator
            compressed: false
            Statistics: Num rows: 1 Data size: 8 Basic stats: COMPLETE Column stats: COMPLETE
            table:
                input format: org.apache.hadoop.mapred.TextInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe

  Stage: Stage-0
    Fetch Operator
      limit: -1
      Processor Tree:
        ListSink
