SELECT COUNT(*)
FROM movies
WHERE array_contains(split(genres,'\\|'), 'Film-Noir');
