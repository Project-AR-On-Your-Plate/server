require("dotenv").config();

const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const pgp = require("pg-promise")();
const db = pgp({
  host: "localhost",
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
  .catch(error => res.status(400).json({error:"invalid input"}))
});

const port = process.env.PORT || 8080;
app.listen( port, function(){
  console.log(`Listening on port number ${port}`);
});
