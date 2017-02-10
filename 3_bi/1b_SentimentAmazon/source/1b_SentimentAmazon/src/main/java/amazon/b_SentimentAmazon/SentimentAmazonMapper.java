package amazon.b_SentimentAmazon;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URI;

public class SentimentAmazonMapper extends Mapper<Object, Text, Text, DoubleWritable> {
	// DoubleWritable object set to the value 1 as counting increment.
	private final static DoubleWritable one = new DoubleWritable(1);
	private final static DoubleWritable minus = new DoubleWritable(-1);

	private String input;
	
	private Set<String> goodWords = new HashSet<String>();
	private Set<String> badWords = new HashSet<String>();
	
	// Word boundary defined as whitespace-characters-word boundary-whitespace 
	private static final Pattern WORD_BOUNDARY = Pattern.compile("\\s*\\b\\s*");
    
	protected void setup(Mapper<Object, Text, Text, DoubleWritable>.Context context) throws IOException, InterruptedException {
		// If the input for this mapper is a file reference, read from the
		// referenced file. Otherwise, read from the InputSplit itself.
		if (context.getInputSplit() instanceof FileSplit) {
			this.input = ((FileSplit) context.getInputSplit()).getPath().toString();
		} else {
			this.input = context.getInputSplit().toString();
		}
		
		// Check for and set boolean runtime variables. 
		Configuration config = context.getConfiguration();
		
		URI[] localPaths = context.getCacheFiles();
		
		parsePositive(localPaths[0]);
		parseNegative(localPaths[1]);
	}
	
	// Parse the positive words to match and capture during Map phase.
	private void parsePositive(URI goodWordsUri) {
		try {
			BufferedReader fis = new BufferedReader(new FileReader(
					new File(goodWordsUri.getPath()).getName()));
			String goodWord;
			while ((goodWord = fis.readLine()) != null) {
				goodWords.add(goodWord);
			}
		} catch (IOException ioe) {
			System.err.println("Caught exception parsing cached file '" + goodWords + "'");
		}
	}
  
	// Parse the negative words to match and capture during Reduce phase.
	private void parseNegative(URI badWordsUri) {
		try {
			BufferedReader fis = new BufferedReader(new FileReader(
					new File(badWordsUri.getPath()).getName()));
			String badWord;
			while ((badWord = fis.readLine()) != null) {
				badWords.add(badWord);
			}
		} catch (IOException ioe) {
			System.err.println("Caught exception while parsing cached file '" + badWords + "'");
		}
	}
  	
	public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
		try {
			JSONObject o = new JSONObject(value.toString());
			String article = o.getString("asin");
			Text keyArt = new Text(article);
			String review = o.getString("reviewText");
			review = review.toLowerCase();
			

			for (String word : WORD_BOUNDARY.split(review)) {
				if (word.isEmpty()) {
					continue;
				}
				
				// Filter and count "good" words.
				if (goodWords.contains(word)) {
					context.write(keyArt,one);
				}

				// Filter and count "bad" words.
				if (badWords.contains(word)) {
					context.write(keyArt,minus);
				}
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}
}
