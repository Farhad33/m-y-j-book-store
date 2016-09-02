const express = require('express')
const router = express.Router()

const { Books, Authors, Genres, Search } = require( '../database' )

const PAGE_SIZE = 10

router.get( '/', function(req, res, next) {
  const page = req.query.page || 1
  const { search, type } = req.query

  const bookFetch = ( search !== undefined && type !== undefined ) ?
    getBooksSearch( search.toLowerCase(), type ) : getBooksPage

    bookListing( bookFetch, page ).then( result => {
      res.render('index', Object.assign( {}, result, { page, search, type: (type || '').replace('by', 'by ') } ))
    })
    .catch( error => res.send({ message: error.message, error }))
})

const getBooksSearch = (search, type) => page => {
  return Search[ type ]( search )
    .then( books => Promise.resolve([ books.length, books ]))
}

const getBooksPage = page =>
  Promise.all([
    Books.count(),
    Books.all( PAGE_SIZE * ( page - 1 ))
  ])

const getAuthorsAndGenres = result => {
  const [ countResult, books ] = result
  const bookIds = books.map( book => book.id )

  if( bookIds.length === 0 ) {
    return Promise.all([
      Promise.resolve( countResult.count ),
      Promise.resolve( books ),
      Promise.resolve( [] ),
      Promise.resolve( [] )
    ])
  }

  return Promise.all([
    Promise.resolve( countResult.count ),
    Promise.resolve( books ),
    Authors.forBooks( bookIds ),
    Genres.forBooks( bookIds )
  ])
}
  
const mergeBookFields = result => {
  const [ count, rawBooks, bookAuthors, bookGenres ] = result

  const books = rawBooks.map( book => {
    const authors = bookAuthors.filter( author => author.book_id === book.id )
    const genres = bookGenres.filter( genre => genre.book_id === book.id )

    return Object.assign( {}, book, { authors, genres })
  })

  return Promise.resolve({ count, books })
}

const bookListing = (bookFetch, page) =>
  bookFetch( page )
    .then( getAuthorsAndGenres )
    .then( mergeBookFields )

module.exports = router 
