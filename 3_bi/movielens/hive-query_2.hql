SELECT COUNT(*) FROM movies WHERE array_contains(split(genres,'\\|'), 'Film-Noir');



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

