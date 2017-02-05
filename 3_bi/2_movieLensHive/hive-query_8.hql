SELECT title
FROM 
  (SELECT title,
         avg(rating) AS rating_av,
         count(rating) AS rating_count
  FROM movies
  LEFT JOIN ratings
      ON (movies.movieId = ratings.movieId)
  WHERE array_contains(split(genres,'\\|'), 'Film-Noir')
  GROUP BY  title
  ORDER BY  rating_av DESC) t
WHERE rating_count > 10 LIMIT 10;
