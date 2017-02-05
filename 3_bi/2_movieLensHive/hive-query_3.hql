SELECT tag_ranked
FROM 
  (SELECT tag AS tag_ranked,
         count(tag) AS tag_count
  FROM tags
  GROUP BY  tag
  ORDER BY  tag_count DESC limit 10) r;
