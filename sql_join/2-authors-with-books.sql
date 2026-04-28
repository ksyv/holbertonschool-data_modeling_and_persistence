SELECT authors.name, books.title
FROM books
LEFT JOIN authors ON books.author_id = authors.id
ORDER BY authors.name, title ASC;