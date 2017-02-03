SELECT title FROM (SELECT title, avg(rating) AS rating_av, count(rating) AS rating_count FROM movies left join ratings ON (movies.movieId = ratings.movieId) WHERE array_contains(split(genres,'\\|'), 'Film-Noir') GROUP BY title ORDER BY rating_av DESC) t WHERE rating_count > 10 LIMIT 10;

hive> SELECT title FROM (SELECT title, avg(rating) AS rating_av, count(rating) AS rating_count FROM movies left join ratings ON (movies.movieId = ratings.movieId) WHERE array_contains(split(genres,'\\|'), 'Film-Noir') GROUP BY title ORDER BY rating_av DESC) t WHERE rating_count > 10 LIMIT 10;
Query ID = cloudera_20170203102424_9e8d652c-0334-4a12-9a18-4200d174d7b9
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
Starting Job = job_1486054229855_0084, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0084/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0084
Hadoop job information for Stage-1: number of mappers: 3; number of reducers: 3
2017-02-03 10:24:17,084 Stage-1 map = 0%,  reduce = 0%
2017-02-03 10:24:30,092 Stage-1 map = 33%,  reduce = 0%, Cumulative CPU 8.59 sec
2017-02-03 10:24:45,165 Stage-1 map = 33%,  reduce = 4%, Cumulative CPU 31.78 sec
2017-02-03 10:24:48,343 Stage-1 map = 33%,  reduce = 7%, Cumulative CPU 37.24 sec
2017-02-03 10:24:49,403 Stage-1 map = 33%,  reduce = 11%, Cumulative CPU 37.65 sec
2017-02-03 10:24:54,722 Stage-1 map = 44%,  reduce = 11%, Cumulative CPU 49.41 sec
2017-02-03 10:24:55,780 Stage-1 map = 56%,  reduce = 11%, Cumulative CPU 52.03 sec
2017-02-03 10:25:16,087 Stage-1 map = 67%,  reduce = 11%, Cumulative CPU 89.23 sec
2017-02-03 10:25:17,169 Stage-1 map = 78%,  reduce = 11%, Cumulative CPU 91.48 sec
2017-02-03 10:25:21,236 Stage-1 map = 79%,  reduce = 11%, Cumulative CPU 94.55 sec
2017-02-03 10:25:23,365 Stage-1 map = 80%,  reduce = 11%, Cumulative CPU 96.56 sec
2017-02-03 10:25:25,561 Stage-1 map = 82%,  reduce = 11%, Cumulative CPU 98.73 sec
2017-02-03 10:25:26,665 Stage-1 map = 84%,  reduce = 11%, Cumulative CPU 101.06 sec
2017-02-03 10:25:27,918 Stage-1 map = 85%,  reduce = 11%, Cumulative CPU 103.29 sec
2017-02-03 10:25:30,061 Stage-1 map = 87%,  reduce = 11%, Cumulative CPU 105.16 sec
2017-02-03 10:25:31,127 Stage-1 map = 89%,  reduce = 11%, Cumulative CPU 107.54 sec
2017-02-03 10:25:33,298 Stage-1 map = 91%,  reduce = 11%, Cumulative CPU 109.96 sec
2017-02-03 10:25:34,476 Stage-1 map = 93%,  reduce = 11%, Cumulative CPU 112.5 sec
2017-02-03 10:25:36,656 Stage-1 map = 95%,  reduce = 11%, Cumulative CPU 114.67 sec
2017-02-03 10:25:37,748 Stage-1 map = 97%,  reduce = 11%, Cumulative CPU 116.78 sec
2017-02-03 10:25:38,842 Stage-1 map = 99%,  reduce = 11%, Cumulative CPU 119.48 sec
2017-02-03 10:25:40,998 Stage-1 map = 100%,  reduce = 19%, Cumulative CPU 120.8 sec
2017-02-03 10:25:42,041 Stage-1 map = 100%,  reduce = 22%, Cumulative CPU 121.14 sec
2017-02-03 10:25:44,128 Stage-1 map = 100%,  reduce = 48%, Cumulative CPU 128.46 sec
2017-02-03 10:25:47,254 Stage-1 map = 100%,  reduce = 67%, Cumulative CPU 137.33 sec
2017-02-03 10:25:50,461 Stage-1 map = 100%,  reduce = 70%, Cumulative CPU 145.89 sec
2017-02-03 10:25:52,602 Stage-1 map = 100%,  reduce = 75%, Cumulative CPU 151.79 sec
2017-02-03 10:25:53,663 Stage-1 map = 100%,  reduce = 78%, Cumulative CPU 154.7 sec
2017-02-03 10:25:55,773 Stage-1 map = 100%,  reduce = 83%, Cumulative CPU 160.5 sec
2017-02-03 10:25:56,831 Stage-1 map = 100%,  reduce = 87%, Cumulative CPU 163.43 sec
2017-02-03 10:25:58,950 Stage-1 map = 100%,  reduce = 93%, Cumulative CPU 169.27 sec
2017-02-03 10:25:59,980 Stage-1 map = 100%,  reduce = 96%, Cumulative CPU 172.31 sec
2017-02-03 10:26:01,012 Stage-1 map = 100%,  reduce = 98%, Cumulative CPU 175.17 sec
2017-02-03 10:26:02,054 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 177.9 sec
MapReduce Total cumulative CPU time: 2 minutes 57 seconds 900 msec
Ended Job = job_1486054229855_0084
Launching Job 2 out of 3
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0085, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0085/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0085
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2017-02-03 10:26:10,169 Stage-2 map = 0%,  reduce = 0%
2017-02-03 10:26:15,369 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 1.49 sec
2017-02-03 10:26:22,658 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 3.66 sec
MapReduce Total cumulative CPU time: 3 seconds 660 msec
Ended Job = job_1486054229855_0085
Launching Job 3 out of 3
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0086, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0086/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0086
Hadoop job information for Stage-3: number of mappers: 1; number of reducers: 1
2017-02-03 10:26:29,269 Stage-3 map = 0%,  reduce = 0%
2017-02-03 10:26:35,493 Stage-3 map = 100%,  reduce = 0%, Cumulative CPU 1.43 sec
2017-02-03 10:26:41,721 Stage-3 map = 100%,  reduce = 100%, Cumulative CPU 3.33 sec
MapReduce Total cumulative CPU time: 3 seconds 330 msec
Ended Job = job_1486054229855_0086
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 3  Reduce: 3   Cumulative CPU: 177.9 sec   HDFS Read: 534881294 HDFS Write: 18091 SUCCESS
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 3.66 sec   HDFS Read: 24779 HDFS Write: 8682 SUCCESS
Stage-Stage-3: Map: 1  Reduce: 1   Cumulative CPU: 3.33 sec   HDFS Read: 13360 HDFS Write: 233 SUCCESS
Total MapReduce CPU Time Spent: 3 minutes 4 seconds 890 msec
OK
Sunset Blvd. (a.k.a. Sunset Boulevard) (1950)
Third Man, The (1949)
Double Indemnity (1944)
Big Sleep, The (1946)
Chinatown (1974)
Notorious (1946)
M (1931)
Maltese Falcon, The (1941)
Touch of Evil (1958)
Strangers on a Train (1951)
Time taken: 151.405 seconds, Fetched: 10 row(s)

