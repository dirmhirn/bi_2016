SELECT title
FROM 
  (SELECT title,
         t.rating_count
  FROM 
    (SELECT title,
         avg(rating) AS rating_av,
         count(rating) AS rating_count
    FROM movies
    LEFT JOIN ratings
        ON (movies.movieId = ratings.movieId)
    GROUP BY  title
    ORDER BY  rating_av DESC) t
    ORDER BY  t.rating_count desc) f LIMIT 10;
