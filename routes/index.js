const express = require('express')
const router = express.Router()

const db = require( '../database' ).Books  // what the hell is .Books ??!!

router.get( '/', function(req, res, next) {
  db.all( 10 )
    .then( books => res.render('index', { books }) )
    .catch( error => res.send({ message: error.message, error }))
})

module.exports = router
