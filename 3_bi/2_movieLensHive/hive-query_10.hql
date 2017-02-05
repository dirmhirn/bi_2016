SELECT title
FROM 
  (SELECT movieId,
         g.tag,
         relevance
  FROM 
    (SELECT tagId,
         tag
    FROM genome_tags
    WHERE tag = 'vienna') g
    LEFT JOIN genome_scores
        ON (genome_scores.tagId = g.tagId)
    ORDER BY  relevance DESC) t
  LEFT JOIN movies
    ON (t.movieId = movies.movieId) LIMIT 15;
