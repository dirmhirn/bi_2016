package amazon.a_AverageReviewScoreAmazon;

import java.io.IOException;
import java.util.Iterator;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reducer;
import org.apache.hadoop.mapred.Reporter;

public class AverageReducer extends MapReduceBase implements Reducer<Text,DoubleWritable,Text,DoubleWritable>{

	public void reduce(Text key, Iterator<DoubleWritable> values,
			OutputCollector<Text, DoubleWritable> output, Reporter reporter)
			throws IOException {
		//Sum scores and count number of reviews
		double count = 0;
		double sum = 0;
		while(values.hasNext()) {
			sum += values.next().get();
			count++;
		}
		output.collect(key, new DoubleWritable(sum/count));
	}

}
