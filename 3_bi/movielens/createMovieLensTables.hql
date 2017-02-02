CREATE TABLE IF NOT EXISTS tags 
(userId int, movieId int, tag String, timestamp int) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS genome_scores 
(movieId int, tagId int, relevance decimal) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS movies 
(movieId string, title string, genres string) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS TEXTFILE;
