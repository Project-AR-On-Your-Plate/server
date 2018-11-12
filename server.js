require("dotenv").config();

const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const pgp = require("pg-promise")();
const db = pgp({
  host: process.env.DB_HOST || 'localhost',
  port: 5432,
  database: process.env.DB_NAME,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD
});



app.use(bodyParser.json());
app.use('/static', express.static('static'));
app.set('view engine', 'hbs');

app.get('/', function(req, res){
  res.render('index');
});

app.get('/dishes', function(req, res){
  db.any(`select * from dishes`)
  .then(data => res.json(data))
  .catch(error => res.status(400).json({error:error.message}))
});

app.post('/orders', function(req, res){
  const orderDetails = req.body;
  const {dish_id, quantity} = orderDetails;
  db.one(`insert into 'orders'(id) values(default) returning id`)
  .then(data => {
    db.none(`insert into 'dishes_orders'(id, dish_id, quantity, order_id) values (default, $1, $2, )`)
  })
})
const port = process.env.PORT || 8080;
app.listen( port, function(){
  console.log(`Listening on port number ${port}`);
});
