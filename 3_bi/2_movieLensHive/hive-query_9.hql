SELECT tag
FROM 
  (SELECT tag,
         g.relevance
  FROM 
    (SELECT tagID,
         relevance
    FROM genome_scores
    WHERE movieId = 1) g
    LEFT JOIN genome_tags
        ON (genome_tags.tagId = g.tagId)
    ORDER BY  g.relevance DESC) f LIMIT 15;
