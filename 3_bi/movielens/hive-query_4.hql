SELECT title FROM (SELECT title, variance(rating) AS rating_var FROM movies left join ratings ON (movies.movieId = ratings.movieId) WHERE year(from_unixtime(ratings.timestamp)) = 2015 GROUP BY title ORDER BY rating_var DESC LIMIT 10) t;

hive> SELECT title FROM (SELECT title, variance(rating) AS rating_var FROM movies left join ratings ON (movies.movieId = ratings.movieId) WHERE year(from_unixtime(ratings.timestamp)) = 2015 GROUP BY title ORDER BY rating_var DESC LIMIT 10) t;
Query ID = cloudera_20170203060909_61342c1e-f9ad-4a6b-86b6-bcfb652dc74e
Total jobs = 3
Stage-1 is selected by condition resolver.
Launching Job 1 out of 3
Number of reduce tasks not specified. Estimated from input data size: 3
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0048, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0048/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0048
Hadoop job information for Stage-1: number of mappers: 3; number of reducers: 3
2017-02-03 06:09:59,991 Stage-1 map = 0%,  reduce = 0%
2017-02-03 06:10:12,850 Stage-1 map = 33%,  reduce = 0%, Cumulative CPU 10.06 sec
2017-02-03 06:10:30,380 Stage-1 map = 33%,  reduce = 4%, Cumulative CPU 32.55 sec
2017-02-03 06:10:33,658 Stage-1 map = 33%,  reduce = 7%, Cumulative CPU 37.73 sec
2017-02-03 06:10:34,736 Stage-1 map = 33%,  reduce = 11%, Cumulative CPU 41.56 sec
2017-02-03 06:10:40,036 Stage-1 map = 44%,  reduce = 11%, Cumulative CPU 52.37 sec
2017-02-03 06:10:42,200 Stage-1 map = 56%,  reduce = 11%, Cumulative CPU 55.48 sec
2017-02-03 06:11:00,292 Stage-1 map = 67%,  reduce = 11%, Cumulative CPU 90.56 sec
2017-02-03 06:11:01,367 Stage-1 map = 78%,  reduce = 11%, Cumulative CPU 93.39 sec
2017-02-03 06:11:04,537 Stage-1 map = 79%,  reduce = 11%, Cumulative CPU 97.98 sec
2017-02-03 06:11:06,662 Stage-1 map = 81%,  reduce = 11%, Cumulative CPU 100.68 sec
2017-02-03 06:11:07,744 Stage-1 map = 84%,  reduce = 11%, Cumulative CPU 103.49 sec
2017-02-03 06:11:09,842 Stage-1 map = 86%,  reduce = 11%, Cumulative CPU 106.07 sec
2017-02-03 06:11:10,885 Stage-1 map = 88%,  reduce = 11%, Cumulative CPU 108.31 sec
2017-02-03 06:11:12,978 Stage-1 map = 89%,  reduce = 11%, Cumulative CPU 110.36 sec
2017-02-03 06:11:14,159 Stage-1 map = 91%,  reduce = 11%, Cumulative CPU 112.7 sec
2017-02-03 06:11:16,256 Stage-1 map = 93%,  reduce = 11%, Cumulative CPU 114.78 sec
2017-02-03 06:11:17,337 Stage-1 map = 94%,  reduce = 11%, Cumulative CPU 116.72 sec
2017-02-03 06:11:18,395 Stage-1 map = 96%,  reduce = 11%, Cumulative CPU 118.68 sec
2017-02-03 06:11:20,523 Stage-1 map = 98%,  reduce = 11%, Cumulative CPU 121.49 sec
2017-02-03 06:11:21,564 Stage-1 map = 100%,  reduce = 11%, Cumulative CPU 123.39 sec
2017-02-03 06:11:22,604 Stage-1 map = 100%,  reduce = 19%, Cumulative CPU 124.35 sec
2017-02-03 06:11:23,850 Stage-1 map = 100%,  reduce = 22%, Cumulative CPU 124.81 sec
2017-02-03 06:11:25,929 Stage-1 map = 100%,  reduce = 38%, Cumulative CPU 129.44 sec
2017-02-03 06:11:26,980 Stage-1 map = 100%,  reduce = 48%, Cumulative CPU 132.03 sec
2017-02-03 06:11:29,111 Stage-1 map = 100%,  reduce = 67%, Cumulative CPU 140.63 sec
2017-02-03 06:11:35,585 Stage-1 map = 100%,  reduce = 69%, Cumulative CPU 157.19 sec
2017-02-03 06:11:38,774 Stage-1 map = 100%,  reduce = 71%, Cumulative CPU 165.48 sec
2017-02-03 06:11:40,878 Stage-1 map = 100%,  reduce = 72%, Cumulative CPU 168.48 sec
2017-02-03 06:11:41,931 Stage-1 map = 100%,  reduce = 74%, Cumulative CPU 174.25 sec
2017-02-03 06:11:44,072 Stage-1 map = 100%,  reduce = 76%, Cumulative CPU 180.15 sec
2017-02-03 06:11:45,131 Stage-1 map = 100%,  reduce = 77%, Cumulative CPU 183.1 sec
2017-02-03 06:11:47,241 Stage-1 map = 100%,  reduce = 79%, Cumulative CPU 188.85 sec
2017-02-03 06:11:48,301 Stage-1 map = 100%,  reduce = 80%, Cumulative CPU 191.73 sec
2017-02-03 06:11:50,424 Stage-1 map = 100%,  reduce = 82%, Cumulative CPU 197.63 sec
2017-02-03 06:11:51,483 Stage-1 map = 100%,  reduce = 83%, Cumulative CPU 200.47 sec
2017-02-03 06:11:53,606 Stage-1 map = 100%,  reduce = 87%, Cumulative CPU 209.26 sec
2017-02-03 06:11:56,825 Stage-1 map = 100%,  reduce = 90%, Cumulative CPU 217.96 sec
2017-02-03 06:12:00,001 Stage-1 map = 100%,  reduce = 93%, Cumulative CPU 226.67 sec
2017-02-03 06:12:02,167 Stage-1 map = 100%,  reduce = 94%, Cumulative CPU 229.59 sec
2017-02-03 06:12:03,232 Stage-1 map = 100%,  reduce = 96%, Cumulative CPU 235.41 sec
2017-02-03 06:12:05,356 Stage-1 map = 100%,  reduce = 98%, Cumulative CPU 241.29 sec
2017-02-03 06:12:06,419 Stage-1 map = 100%,  reduce = 99%, Cumulative CPU 244.99 sec
2017-02-03 06:12:08,495 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 250.16 sec
MapReduce Total cumulative CPU time: 4 minutes 10 seconds 160 msec
Ended Job = job_1486054229855_0048
Launching Job 2 out of 3
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0049, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0049/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0049
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2017-02-03 06:12:17,157 Stage-2 map = 0%,  reduce = 0%
2017-02-03 06:12:23,483 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 4.12 sec
2017-02-03 06:12:30,754 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 7.7 sec
MapReduce Total cumulative CPU time: 7 seconds 700 msec
Ended Job = job_1486054229855_0049
Launching Job 3 out of 3
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0050, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0050/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0050
Hadoop job information for Stage-3: number of mappers: 1; number of reducers: 1
2017-02-03 06:12:38,482 Stage-3 map = 0%,  reduce = 0%
2017-02-03 06:12:45,768 Stage-3 map = 100%,  reduce = 0%, Cumulative CPU 3.95 sec
2017-02-03 06:12:53,024 Stage-3 map = 100%,  reduce = 100%, Cumulative CPU 6.26 sec
MapReduce Total cumulative CPU time: 6 seconds 260 msec
Ended Job = job_1486054229855_0050
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 3  Reduce: 3   Cumulative CPU: 250.16 sec   HDFS Read: 534881375 HDFS Write: 987932 SUCCESS
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 7.7 sec   HDFS Read: 993279 HDFS Write: 780132 SUCCESS
Stage-Stage-3: Map: 1  Reduce: 1   Cumulative CPU: 6.26 sec   HDFS Read: 784828 HDFS Write: 320 SUCCESS
Total MapReduce CPU Time Spent: 4 minutes 24 seconds 120 msec
OK
Rent-a-Kid (1995)
Harder They Come, The (1973)
Docks of New York, The (1928)
A Cinderella Story: Once Upon a Song (2011)
Born in Flames (1983)
Elle: A Modern Cinderella Tale (2011)
Conspirators of Pleasure (Spiklenci slasti) (1996)
The War at Home (1979)
Jesse Stone: Sea Change (2007)
Cry_Wolf (a.k.a. Cry Wolf) (2005)
Time taken: 180.97 seconds, Fetched: 10 row(s)

