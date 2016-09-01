const express = require('express')
const router = express.Router()

const Books = require( '../database' ).Books

const PAGE_SIZE = 10

router.get( '/', function(req, res, next) {
  const page = req.query.page || 1

  Promise.all([
    Books.count(),
    Books.all( PAGE_SIZE * ( page - 1 ))
  ])
  .then( result => res.render('index', { page, count: result[ 0 ].count, books: result[ 1 ] }) )
  .catch( error => res.send({ message: error.message, error }))
})

module.exports = router
