const express = require('express')
const router = express.Router()

const { Books, Authors, BookAuthors } = require( '../database' )

router.get( '/add', ( req, res, next ) => {
  res.render( 'books/form' )
})

router.get( '/:id', ( req, res, next ) => {
  const { id } = req.params

  Promise.all([
    Books.findById( id ),
    Books.findAuthorsByBookId( id ),
    Books.findGenresByBookId( id )
  ])
  .then( result => {
    const [ book, authors, genres ] = result
    res.render( 'books/detail', { book, authors, genres })
  })
  .catch( error => res.send({ error, message: error.message }))
})

router.post( '/', ( req, res, next ) => {
  const { title, description, image, published, author } = req.body

  Promise.all([
    Books.createBook( title, description, image, published ),
    Authors.create( author )
  ])
  .then( result => BookAuthors.create( result[ 0 ].id, result[ 1 ].id ))
  .then( result => res.redirect( `/books/${result.book_id}` ))
  .catch( error => res.send({ message: error.message }))
})

router.delete( '/:id', ( req, res, next ) => {
  res.redirect( '/' )
})

module.exports = router
