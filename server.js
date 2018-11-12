require("dotenv").config();

const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const pgp = require("pg-promise")();
const db = pgp({
  host: process.env.DB_HOST || "localhost",
  port: 5432,
  database: process.env.DB_NAME,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD
});


app.use(bodyParser.json());
// app.use('/static', express.static('static'));
app.set('view engine', 'hbs');

app.get('/', function(req, res){
  res.render('index');
});

app.get('/dishes', function(req, res){
  db.any(`select * from dishes`)
  .then(data => res.json(data))
  .catch(error => res.status(400).json({error:error.message}))
});

app.get('/orders', function(req, res){
  db.any(`select * from orders`)
  .then(data => res.json(data))
  .catch(error => res.status(400).json({error:error.message}))
});

app.post("/orders", function(req, res){
  const orderDetails = Object.values(req.body);
console.log(orderDetails)
  db.one(`insert into orders(id) values(default) returning id`)
  .then(data => {
    return Promise.all(
            orderDetails.map(item => {
              const { dish_id, quantity } = item;
              return db.none(
                `insert into dishes_orders(dish_id, order_id,quantity)
            VALUES($1, $2, $3)`,
                [dish_id, data.id, quantity]
              )
            })
          ).then(()=>data.id)
  })
  .then(orderId => res.json({ order_id: orderId, message: "new order accepted" }))
  .catch(error => res.status(400).json({error: error.message}))
});

const port = process.env.PORT || 8080;
app.listen( port, function(){
  console.log(`Listening on port number ${port}`);
});
