const pgp = require( 'pg-promise' )()
const db = pgp({ database: 'bookstore' })

const createBookSql = 'INSERT INTO books (title, description, image, published ) VALUES ( $1, $2, $3, $4 ) RETURNING id'

const Books = {
  count: () => db.one( 'SELECT COUNT(*) FROM books' ),
  all: offset => db.any( 'SELECT * FROM books order by id asc LIMIT 10 OFFSET $1', [offset] ),
  findById: id => db.one( 'SELECT * FROM books WHERE id=$1', [id] ),
  findAuthorsByBookId: id => db.any('SELECT * FROM authors JOIN book_authors ON book_authors.author_id=authors.id WHERE book_authors.book_id=$1', [id]),
  findGenresByBookId: id => db.any('SELECT * FROM genres JOIN book_genres ON book_genres.genre_id=genres.id WHERE book_genres.book_id=$1', [id]),
  createBook: ( title, description, image, published ) => db.one( createBookSql, [title, description, image, published] ),
  delete: id => db.none( 'DELETE FROM books WHERE id=$1', [id])
}

const Authors = {
  create: name => db.one( 'INSERT INTO authors ( name ) VALUES ( $1 ) RETURNING id', [name] ),
  all: all => db.any( 'SELECT * FROM authors order by id asc' ),
  forBooks: ids => db.any( 'SELECT * FROM authors JOIN book_authors ON book_authors.author_id=authors.id WHERE book_authors.book_id IN ($1:csv)', [ids] )
}

const Genres = {
  forBooks: ids => db.any( 'SELECT * FROM genres JOIN book_genres ON book_genres.genre_id=genres.id WHERE book_genres.book_id IN ($1:csv)', [ids] )
}

const BookAuthors = {
  create: (book_id, author_id) => db.one( 'INSERT INTO book_authors ( book_id, author_id ) VALUES ( $1, $2 ) RETURNING book_id', [ book_id, author_id ] ),
  all: all => db.any( 'SELECT * FROM book_authors' )
}

const Search = {
  byTitle: title => {
    const sql = `SELECT * FROM books WHERE lower(title) LIKE '%${title}%'`

    return db.any( sql )
  },
  byGenre: genreName => {
    const sql = 
      `SELECT books.* FROM books 
       JOIN book_genres ON book_genres.book_id=books.id 
       JOIN genres ON book_genres.genre_id=genres.id 
       WHERE lower(genres.name) LIKE '%${genreName}%'`
    console.log( sql )

    return db.any( sql )
  },
  byAuthor: authorName => {
    const sql = 
      `SELECT books.* FROM books 
       JOIN book_authors ON book_authors.book_id=books.id 
       JOIN authors ON book_authors.author_id=authors.id 
       WHERE lower(authors.name) LIKE '%${authorName}%'`
    console.log( sql )

    return db.any( sql )
  },
}

module.exports = {
  Books, Authors, BookAuthors, Genres, Search
}