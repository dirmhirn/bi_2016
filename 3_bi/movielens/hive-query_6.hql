SELECT title FROM (SELECT title, count (tag) AS tag_count FROM movies left join tags ON (movies.movieId = tags.movieId) WHERE tag = 'mars' GROUP BY title ORDER BY tag_count DESC LIMIT 15) t;


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

