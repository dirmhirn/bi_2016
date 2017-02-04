SELECT title
FROM 
  (SELECT movieId,
         g.tag,
         relevance
  FROM 
    (SELECT tagId,
         tag
    FROM genome_tags
    WHERE tag = 'vienna') g
    LEFT JOIN genome_scores
        ON (genome_scores.tagId = g.tagId)
    ORDER BY  relevance DESC) t
  LEFT JOIN movies
    ON (t.movieId = movies.movieId) LIMIT 15;


hive> SELECT title FROM (SELECT movieId, g.tag, relevance FROM (SELECT tagID, tag FROM genome_tags WHERE tag = 'vienna') g LEFT JOIN genome_scores ON (genome_scores.tagId = g.tagId) ORDER BY relevance DESC) t LEFT JOIN movies ON (t.movieId = movies.movieId) LIMIT 15;
Query ID = cloudera_20170203145858_32eef9ce-20a8-41fa-9cbb-a13d2c27dd95
Total jobs = 3
Stage-1 is selected by condition resolver.
Launching Job 1 out of 3
Number of reduce tasks not specified. Estimated from input data size: 2
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0101, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0101/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0101
Hadoop job information for Stage-1: number of mappers: 3; number of reducers: 2
2017-02-03 14:58:41,869 Stage-1 map = 0%,  reduce = 0%
2017-02-03 14:58:53,059 Stage-1 map = 33%,  reduce = 0%, Cumulative CPU 1.79 sec
2017-02-03 14:59:03,927 Stage-1 map = 56%,  reduce = 0%, Cumulative CPU 19.94 sec
2017-02-03 14:59:07,126 Stage-1 map = 67%,  reduce = 0%, Cumulative CPU 24.34 sec
2017-02-03 14:59:08,245 Stage-1 map = 67%,  reduce = 11%, Cumulative CPU 27.65 sec
2017-02-03 14:59:10,335 Stage-1 map = 67%,  reduce = 22%, Cumulative CPU 28.08 sec
2017-02-03 14:59:16,688 Stage-1 map = 78%,  reduce = 22%, Cumulative CPU 37.79 sec
2017-02-03 14:59:35,723 Stage-1 map = 89%,  reduce = 22%, Cumulative CPU 56.32 sec
2017-02-03 14:59:38,870 Stage-1 map = 91%,  reduce = 22%, Cumulative CPU 59.33 sec
2017-02-03 14:59:41,018 Stage-1 map = 93%,  reduce = 22%, Cumulative CPU 62.31 sec
2017-02-03 14:59:44,146 Stage-1 map = 96%,  reduce = 22%, Cumulative CPU 65.26 sec
2017-02-03 14:59:47,248 Stage-1 map = 98%,  reduce = 22%, Cumulative CPU 68.22 sec
2017-02-03 14:59:49,331 Stage-1 map = 100%,  reduce = 22%, Cumulative CPU 70.16 sec
2017-02-03 14:59:51,477 Stage-1 map = 100%,  reduce = 43%, Cumulative CPU 72.31 sec
2017-02-03 14:59:53,595 Stage-1 map = 100%,  reduce = 66%, Cumulative CPU 76.05 sec
2017-02-03 14:59:54,639 Stage-1 map = 100%,  reduce = 69%, Cumulative CPU 79.21 sec
2017-02-03 14:59:56,724 Stage-1 map = 100%,  reduce = 73%, Cumulative CPU 82.23 sec
2017-02-03 14:59:57,760 Stage-1 map = 100%,  reduce = 77%, Cumulative CPU 85.18 sec
2017-02-03 14:59:59,829 Stage-1 map = 100%,  reduce = 81%, Cumulative CPU 88.18 sec
2017-02-03 15:00:00,860 Stage-1 map = 100%,  reduce = 85%, Cumulative CPU 91.31 sec
2017-02-03 15:00:02,929 Stage-1 map = 100%,  reduce = 89%, Cumulative CPU 94.39 sec
2017-02-03 15:00:03,961 Stage-1 map = 100%,  reduce = 94%, Cumulative CPU 97.38 sec
2017-02-03 15:00:06,026 Stage-1 map = 100%,  reduce = 97%, Cumulative CPU 100.26 sec
2017-02-03 15:00:07,072 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 103.83 sec
MapReduce Total cumulative CPU time: 1 minutes 43 seconds 830 msec
Ended Job = job_1486054229855_0101
Launching Job 2 out of 3
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1486054229855_0102, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0102/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0102
Hadoop job information for Stage-2: number of mappers: 1; number of reducers: 1
2017-02-03 15:00:15,217 Stage-2 map = 0%,  reduce = 0%
2017-02-03 15:00:22,579 Stage-2 map = 100%,  reduce = 0%, Cumulative CPU 4.97 sec
2017-02-03 15:00:28,814 Stage-2 map = 100%,  reduce = 100%, Cumulative CPU 7.73 sec
MapReduce Total cumulative CPU time: 7 seconds 730 msec
Ended Job = job_1486054229855_0102
Execution log at: /tmp/cloudera/cloudera_20170203145858_32eef9ce-20a8-41fa-9cbb-a13d2c27dd95.log
2017-02-03 03:00:33	Starting to launch local task to process map join;	maximum memory = 932184064
2017-02-03 03:00:35	Dump the side-table for tag: 1 with group count: 27278 into file: file:/tmp/cloudera/d9cf09a2-c76f-4eed-95ab-219d673f6dc2/hive_2017-02-03_14-58-36_000_8051080243603866221-1/-local-10006/HashTable-Stage-6/MapJoin-mapfile31--.hashtable
2017-02-03 03:00:35	Uploaded 1 File to: file:/tmp/cloudera/d9cf09a2-c76f-4eed-95ab-219d673f6dc2/hive_2017-02-03_14-58-36_000_8051080243603866221-1/-local-10006/HashTable-Stage-6/MapJoin-mapfile31--.hashtable (1506704 bytes)
2017-02-03 03:00:35	End of local task; Time Taken: 1.939 sec.
Execution completed successfully
MapredLocal task succeeded
Launching Job 3 out of 3
Number of reduce tasks is set to 0 since there's no reduce operator
Starting Job = job_1486054229855_0103, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1486054229855_0103/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1486054229855_0103
Hadoop job information for Stage-6: number of mappers: 1; number of reducers: 0
2017-02-03 15:00:42,710 Stage-6 map = 0%,  reduce = 0%
2017-02-03 15:00:48,953 Stage-6 map = 100%,  reduce = 0%, Cumulative CPU 2.31 sec
MapReduce Total cumulative CPU time: 2 seconds 310 msec
Ended Job = job_1486054229855_0103
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 3  Reduce: 2   Cumulative CPU: 103.83 sec   HDFS Read: 323592119 HDFS Write: 301182 SUCCESS
Stage-Stage-2: Map: 1  Reduce: 1   Cumulative CPU: 7.73 sec   HDFS Read: 305521 HDFS Write: 211201 SUCCESS
Stage-Stage-6: Map: 1   Cumulative CPU: 2.31 sec   HDFS Read: 5900 HDFS Write: 400 SUCCESS
Total MapReduce CPU Time Spent: 1 minutes 53 seconds 870 msec
OK
Third Man, The (1949)
Johnny Guitar (1954)
Before Sunrise (1995)
Before Sunset (2004)
Before Midnight (2013)
Night Porter, The (Portiere di notte, Il) (1974)
Illusionist, The (2006)
Amadeus (1984)
Foreign Affair, A (1948)
Love in the Afternoon (1957)
Odessa File, The (1974)
Bad Timing: A Sensual Obsession (1980)
Best Offer, The (Migliore offerta, La) (2013)
Odd Man Out (1947)
Stranger, The (1946)
Time taken: 134.024 seconds, Fetched: 15 row(s)


EXPLAIN:
STAGE DEPENDENCIES:
  Stage-8 is a root stage , consists of Stage-1
  Stage-1
  Stage-2 depends on stages: Stage-1
  Stage-9 depends on stages: Stage-2
  Stage-6 depends on stages: Stage-9
  Stage-0 depends on stages: Stage-6

STAGE PLANS:
  Stage: Stage-8
    Conditional Operator

  Stage: Stage-1
    Map Reduce
      Map Operator Tree:
          TableScan
            alias: genome_tags
            Statistics: Num rows: 1809 Data size: 18092 Basic stats: COMPLETE Column stats: NONE
            Filter Operator
              predicate: (tag = 'vienna') (type: boolean)
              Statistics: Num rows: 904 Data size: 9040 Basic stats: COMPLETE Column stats: NONE
              Select Operator
                expressions: tagid (type: int)
                outputColumnNames: _col0
                Statistics: Num rows: 904 Data size: 9040 Basic stats: COMPLETE Column stats: NONE
                Reduce Output Operator
                  key expressions: _col0 (type: int)
                  sort order: +
                  Map-reduce partition columns: _col0 (type: int)
                  Statistics: Num rows: 904 Data size: 9040 Basic stats: COMPLETE Column stats: NONE
          TableScan
            alias: genome_scores
            Statistics: Num rows: 2696202 Data size: 323544352 Basic stats: COMPLETE Column stats: NONE
            Reduce Output Operator
              key expressions: tagid (type: int)
              sort order: +
              Map-reduce partition columns: tagid (type: int)
              Statistics: Num rows: 2696202 Data size: 323544352 Basic stats: COMPLETE Column stats: NONE
              value expressions: movieid (type: int), relevance (type: decimal(25,24))
      Reduce Operator Tree:
        Join Operator
          condition map:
               Left Outer Join0 to 1
          keys:
            0 _col0 (type: int)
            1 tagid (type: int)
          outputColumnNames: _col2, _col4
          Statistics: Num rows: 2965822 Data size: 355898794 Basic stats: COMPLETE Column stats: NONE
          Select Operator
            expressions: _col2 (type: int), _col4 (type: decimal(25,24))
            outputColumnNames: _col0, _col2
            Statistics: Num rows: 2965822 Data size: 355898794 Basic stats: COMPLETE Column stats: NONE
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
              key expressions: _col2 (type: decimal(25,24))
              sort order: -
              Statistics: Num rows: 2965822 Data size: 355898794 Basic stats: COMPLETE Column stats: NONE
              value expressions: _col0 (type: int)
      Reduce Operator Tree:
        Select Operator
          expressions: VALUE._col0 (type: int)
          outputColumnNames: _col0
          Statistics: Num rows: 2965822 Data size: 355898794 Basic stats: COMPLETE Column stats: NONE
          File Output Operator
            compressed: false
            table:
                input format: org.apache.hadoop.mapred.SequenceFileInputFormat
                output format: org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat
                serde: org.apache.hadoop.hive.serde2.lazybinary.LazyBinarySerDe

  Stage: Stage-9
    Map Reduce Local Work
      Alias -> Map Local Tables:
        movies 
          Fetch Operator
            limit: -1
      Alias -> Map Local Operator Tree:
        movies 
          TableScan
            alias: movies
            Statistics: Num rows: 6987 Data size: 1397520 Basic stats: COMPLETE Column stats: NONE
            HashTable Sink Operator
              keys:
                0 UDFToDouble(_col0) (type: double)
                1 UDFToDouble(movieid) (type: double)

  Stage: Stage-6
    Map Reduce
      Map Operator Tree:
          TableScan
            Map Join Operator
              condition map:
                   Left Outer Join0 to 1
              keys:
                0 UDFToDouble(_col0) (type: double)
                1 UDFToDouble(movieid) (type: double)
              outputColumnNames: _col4
              Statistics: Num rows: 3262404 Data size: 391488681 Basic stats: COMPLETE Column stats: NONE
              Select Operator
                expressions: _col4 (type: string)
                outputColumnNames: _col0
                Statistics: Num rows: 3262404 Data size: 391488681 Basic stats: COMPLETE Column stats: NONE
                Limit
                  Number of rows: 15
                  Statistics: Num rows: 15 Data size: 1800 Basic stats: COMPLETE Column stats: NONE
                  File Output Operator
                    compressed: false
                    Statistics: Num rows: 15 Data size: 1800 Basic stats: COMPLETE Column stats: NONE
                    table:
                        input format: org.apache.hadoop.mapred.TextInputFormat
                        output format: org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat
                        serde: org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe
      Local Work:
        Map Reduce Local Work

  Stage: Stage-0
    Fetch Operator
      limit: 15
      Processor Tree:
        ListSink

