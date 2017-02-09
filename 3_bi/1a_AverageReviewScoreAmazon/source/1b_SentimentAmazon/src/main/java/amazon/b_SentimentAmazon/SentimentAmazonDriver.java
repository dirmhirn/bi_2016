package amazon.b_SentimentAmazon;

import java.io.File;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;
import org.apache.hadoop.mapreduce.Job; 

// Classes for File IO
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

// Wrappers for data types
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;

public class SentimentAmazonDriver extends Configured implements Tool {
	//First arg = input, 2nd = output, 3rd = positive words, 4th = negative words
	public static void main(String[] args) throws Exception {
		if(args.length != 4) {
			System.out.println("Invalid Parameters!");
			return;
		}
		File in = new File(args[0]);
		if(!in.exists()) {
			System.out.println("Invalid Path!");
			return;
		}
		File out = new File(args[1]);
		if(out.exists()) {
			System.out.println("Invalid Path!");
			return;
		}
		File pos = new File(args[2]);
		if(!pos.exists()) {
			System.out.println("Invalid Path!");
			return;
		}
		File neg = new File(args[3]);
		if(!neg.exists()) {
			System.out.println("Invalid Path!");
			return;
		}
		
		int res = ToolRunner.run(new SentimentAmazonDriver(), args);
		System.exit(res);
	}
		
	public int run(String[] args) throws Exception {
		Job job = Job.getInstance(getConf(), "sentiment");
		job.addCacheFile(new Path(args[2]).toUri());
		job.addCacheFile(new Path(args[3]).toUri());
		job.setJarByClass(this.getClass());
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		job.setMapperClass(SentimentAmazonMapper.class);
		job.setReducerClass(SentimentAmazonReducer.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(DoubleWritable.class);
		int result = job.waitForCompletion(true) ? 0 : 1;
		return result;
	}
}
