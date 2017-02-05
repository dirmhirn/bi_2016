SELECT title
FROM 
  (SELECT title,
         variance(rating) AS rating_var
  FROM movies
  LEFT JOIN ratings
      ON (movies.movieId = ratings.movieId)
  WHERE year(from_unixtime(ratings.timestamp)) = 2015
  GROUP BY  title
  ORDER BY  rating_var DESC LIMIT 10) t;
