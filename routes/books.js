const express = require('express')
const router = express.Router()

const Books = require( '../database' ).Books

router.get( '/add', ( req, res, next ) => {
  res.render( 'books/form' )
})

router.get( '/:id', ( req, res, next ) => {
  Books.findById( req.params.id )
    .then( book => res.render( 'books/detail', { book }) )
})

router.post( '/', ( req, res, next ) => {
  res.send({ message: 'posted to books' })
})

router.delete( '/:id', ( req, res, next ) => {
  res.redirect( '/' )
})

module.exports = router
