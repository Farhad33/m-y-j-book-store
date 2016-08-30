var express = require('express');
var router = express.Router();

router.get( '/:id', ( req, res, next ) => {
  res.render( 'detail', { book: { title: 'Hi' } } )
})

module.exports = router;
