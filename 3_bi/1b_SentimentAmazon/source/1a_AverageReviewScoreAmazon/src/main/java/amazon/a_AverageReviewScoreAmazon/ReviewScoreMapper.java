package amazon.a_AverageReviewScoreAmazon;

import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.Mapper;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reporter;

public class ReviewScoreMapper extends MapReduceBase implements Mapper<Object, Text, Text, DoubleWritable> {

	public void map(Object key, Text value,
			OutputCollector<Text, DoubleWritable> output, Reporter reporter)
			throws IOException {
		//Read/Map articles (ids) and their respective ratings
		String line = value.toString();
		StringTokenizer itr = new StringTokenizer(line,",");
		String keyS;
		itr.nextToken();
		keyS = itr.nextToken();
		String word = itr.nextToken();
		double rating = Double.valueOf(word);
		output.collect(new Text(keyS), new DoubleWritable(rating));
		
	}

}
