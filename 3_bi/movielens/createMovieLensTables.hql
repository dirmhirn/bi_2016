-- BI 2016W TU Wien
-- group 36
-- create tables

CREATE TABLE IF NOT EXISTS tags 
(userId int, movieId int, tag string, timestamp int) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS genome_scores 
(movieId int, tagId int, relevance decimal(25,24)) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS movies 
(movieId string, title string, genres string) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS genome_tags 
(tagId int, tag string) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS ratings 
(userId int, movieId int, rating decimal(2,1), timestamp int) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE;


