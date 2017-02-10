package amazon.a_AverageReviewScoreAmazon;
import java.io.File;
import java.io.IOException;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;

public class ReviewScoreAverageDriver 
{
    public static void main( String[] args ) throws ClassNotFoundException, IOException, InterruptedException
    {
    	if(args.length != 2) {
    		System.out.println("Invalid Number of arguments!");
    		return;
    	}
    	
    	JobConf conf = new JobConf(ReviewScoreAverageDriver.class);
    	conf.setJobName("avgscore");
    	conf.setMapperClass(ReviewScoreMapper.class);
    	conf.setCombinerClass(AverageReducer.class);
    	conf.setReducerClass(AverageReducer.class);
    	FileInputFormat.setInputPaths(conf, args[0]);
    	FileOutputFormat.setOutputPath(conf, new Path(args[1]));
    	conf.setOutputKeyClass(Text.class);
    	conf.setOutputValueClass(DoubleWritable.class); 
    	JobClient.runJob(conf);
    }
}
