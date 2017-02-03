SELECT tag_ranked FROM (SELECT tag AS tag_ranked, count(tag) as tag_count FROM tags GROUP BY tag ORDER BY tag_count DESC limit 10) r;


hive> SELECT tag_ranked FROM (SELECT tag AS tag_ranked, count(tag) as tag_count FROM tags GROUP BY tag ORDER BY tag_count DESC limit 10) r;
Query ID = cloudera_20170203042727_35a8edb0-37aa-439d-bd7f-dfff3aa777b7
Total jobs = 2
Launching Job 1 out of 2
Number of reduce tasks not specified. Defaulting to jobconf value of: 5
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0013, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0013/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0013
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 5
2017-02-03 04:28:03,219 Stage-1 map = 0%,  reduce = 0%
2017-02-03 04:28:10,493 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 3.72 sec
2017-02-03 04:28:23,629 Stage-1 map = 100%,  reduce = 20%, Cumulative CPU 7.12 sec
2017-02-03 04:28:26,937 Stage-1 map = 100%,  reduce = 40%, Cumulative CPU 10.44 sec
2017-02-03 04:28:27,974 Stage-1 map = 100%,  reduce = 80%, Cumulative CPU 17.05 sec
2017-02-03 04:28:29,013 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 20.19 sec
MapReduce Total cumulative CPU time: 20 seconds 190 msec
Ended Job = job_1486054229855_0013
Launching Job 2 out of 2
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0014, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0014/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0014
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2017-02-03 04:28:36,077 Stage-2 map = 0%,  reduce = 0%
2017-02-03 04:28:42,298 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 3.97 sec
2017-02-03 04:28:49,613 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 6.2 sec
MapReduce Total cumulative CPU time: 6 seconds 200 msec
Ended Job = job_1486054229855_0014
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 5   Cumulative CPU: 20.19 sec   HDFS Read: 16621898 HDFS Write: 1319171 SUCCESS
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 6.2 sec   HDFS Read: 1324930 HDFS Write: 90 SUCCESS
Total MapReduce CPU Time Spent: 26 seconds 390 msec
OK
sci-fi
based on a book
atmospheric
comedy
action
surreal
BD-R
twist ending
funny
dystopia
Time taken: 54.557 seconds, Fetched: 10 row(s)

