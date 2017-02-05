SELECT title,
         count (tag) AS tag_count
FROM movies
LEFT JOIN tags
    ON (movies.movieId = tags.movieId)
GROUP BY  title
ORDER BY  tag_count DESC LIMIT 10;
