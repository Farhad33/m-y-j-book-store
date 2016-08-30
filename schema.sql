
DROP TABLE IF EXISTS books;

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  image VARCHAR(255),
  published DATE
);

DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS genres;

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

DROP TABLE IF EXISTS book_authors;

CREATE TABLE book_authors (
  book_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL
);

DROP TABLE IF EXISTS book_genres;

CREATE TABLE book_genres (
  book_id INTEGER NOT NULL,
  genre_id INTEGER NOT NULL
);

--- Data Injection

INSERT INTO books (title)
VALUES ('Gone With the Wind'),
('Wealth of Nations'),
('The Alchemist'),
('The Great Gatsby'),
('The Hobbit'),
('The Lord of the Rings'),
('The Ethical Slut'),
('1984'),
('Anna Karenina'),
('A Tale of Two Cities'),
('No Mud No Lotus'),
('The Odyssey'),
('Tartuffe'),
('Shane'),
('Brave New World'),
('The Hound of the Baskervilles');

INSERT INTO authors (name)
VALUES ('Adam Smith'),
('Paulo Coehlo'),
('F. Scott Fitzgerald'),
('J. R. R. Tolkien'),
('Margaret Mitchell'),
('Dossie Eaton'),
('Janet W. Hardy'),
('George Orwell'),
('Leo Tolstoy'),
('Homer'),
('Moliere'),
('Aldous Huxley'),
('Jack Schaefer'),
('Arthur Conan Doyle'),
('Thich Nhat Hanh'),
('Charles Dickens');

INSERT INTO genres (name)
VALUES ('Economics'),
('Science Fiction'),
('Fantasy'),
('Young Adult'),
('Historical Drama'),
('Romance'),
('Horror'),
('Satire'),
('Mystery'),
('Dystopian Fiction'),
('Self Help');

--- Join Tables Start Here

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'The Great Gatsby'
  AND authors.name = 'F. Scott Fitzgerald';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'Wealth of Nations'
  AND authors.name = 'Adam Smith';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'The Alchemist'
  AND authors.name = 'Paulo Coehlo';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'Gone With the Wind'
  AND authors.name = 'Margaret Mitchell';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'The Hobbit'
  AND authors.name = 'J. R. R. Tolkien';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'The Lord of the Rings'
  AND authors.name = 'J. R. R. Tolkien';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'A Tale of Two Cities'
  AND authors.name = 'Charles Dickens';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'The Odyssey'
  AND authors.name = 'Homer';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'Tartuffe'
  AND authors.name = 'Moliere';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'The Hound of the Baskervilles'
  AND authors.name = 'Arthur Conan Doyle';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'The Ethical Slut'
  AND authors.name = 'Janet W. Hardy';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'The Ethical Slut'
  AND authors.name = 'Dossie Eaton';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'Brave New World'
  AND authors.name = 'Aldous Huxley';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'No Mud No Lotus'
  AND authors.name = 'Thich Nhat Hanh';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'Shane'
  AND authors.name = 'Jack Schaefer';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = '1984'
  AND authors.name = 'George Orwell';

INSERT INTO book_authors
  SELECT books.id, authors.id FROM books
  CROSS JOIN authors
  WHERE books.title = 'Anna Karenina'
  AND authors.name = 'Leo Tolstoy';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'Wealth of Nations'
  AND genres.name = 'Economics';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'The Great Gatsby'
  AND genres.name = 'Historical Drama';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'Gone With the Wind'
  AND genres.name = 'Historical Drama';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'The Alchemist'
  AND genres.name = 'Fantasy';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'The Hobbit'
  AND genres.name = 'Fantasy';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'The Lord of the Rings'
  AND genres.name = 'Fantasy';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'The Hound of the Baskervilles'
  AND genres.name = 'Mystery';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = '1984'
  AND genres.name = 'Dystopian Fiction';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'The Ethical Slut'
  AND genres.name = 'Self Help';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'The Odyssey'
  AND genres.name = 'Fantasy';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'The Odyssey'
  AND genres.name = 'Historical Drama';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'Tartuffe'
  AND genres.name = 'Historical Drama';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'No Mud No Lotus'
  AND genres.name = 'Self Help';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'A Tale of Two Cities'
  AND genres.name = 'Historical Drama';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'Brave New World'
  AND genres.name = 'Dystopian Fiction';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'Anna Karenina'
  AND genres.name = 'Historical Drama';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'Shane'
  AND genres.name = 'Young Adult';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'The Hound of the Baskervilles'
  AND genres.name = 'Young Adult';

INSERT INTO book_genres
  SELECT books.id, genres.id FROM books
  CROSS JOIN genres
  WHERE books.title = 'Tartuffe'
  AND genres.name = 'Young Adult';

