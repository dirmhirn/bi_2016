SELECT title
FROM 
  (SELECT title,
         count (tag) AS tag_count
  FROM movies
  LEFT JOIN tags
      ON (movies.movieId = tags.movieId)
  WHERE tag = 'mars'
  GROUP BY  title
  ORDER BY  tag_count DESC LIMIT 15) t;
