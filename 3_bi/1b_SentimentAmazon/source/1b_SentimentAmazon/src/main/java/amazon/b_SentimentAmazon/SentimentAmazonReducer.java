package amazon.b_SentimentAmazon;

import java.io.IOException;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class SentimentAmazonReducer extends Reducer<Text,DoubleWritable,Text,DoubleWritable>{
	@Override
	public void reduce(Text word, Iterable<DoubleWritable> instances, Context context) throws IOException, InterruptedException {
		double pos = 0;
		double neg = 0;
		
		// Sum up positive/negative words
		for (DoubleWritable instance : instances) {
			if(instance.get() > 0) {
				pos++;
			} else if(instance.get() < 0) {
				neg++;
			}
		}
		
		// Calculate sentiment
		if(pos == neg) {
			context.write(word,new DoubleWritable(0));
		} else {
			double a = pos + neg;
			double b = pos - neg;
			double sentiment = b / a;
			context.write(word,new DoubleWritable(sentiment));
		}
	}
}
