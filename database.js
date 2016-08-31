const pgp = require( 'pg-promise' )()
const db = pgp({ database: 'bookstore' })

const Books = {
  all: limit => db.any( 'SELECT * FROM books LIMIT $1', [limit] ),
  findById: id => db.one( 'SELECT * FROM books WHERE id=$1', [id] ) // what's id=$1
}

module.exports = {
  Books
}