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

const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const notifyServiceSid = process.env.TWILIO_NOTIFY_SERVICE_SID;

const client = require("twilio")(accountSid, authToken);

app.use(bodyParser.json());
// app.use('/static', express.static('static'));
app.set("view engine", "hbs");

app.get("/", function(req, res) {
  res.render("index");
});

app.get("/dishes", function(req, res) {
  db.any(`select * from dishes order by category desc`)
    .then(data => res.json(data))
    .catch(error => res.status(400).json({ error: error.message }));
});

app.get("/orders", function(req, res) {
  db.any(`select * from orders`)
    .then(data => res.json(data))
    .catch(error => res.status(400).json({ error: error.message }));
});

app.get("/dishes_orders", function(req, res) {
  db.any(`select * from dishes_orders`)
    .then(data => res.json(data))
    .catch(error => res.status(400).json({ error: error.message }));
});

app.post("/orders", function(req, res) {
  const orderObject = req.body;

  const currentOrder = orderObject.currentOrder;
  const userDetails = currentOrder.user;
  const orderDetails = currentOrder.order;
  // const orderDetails = Object.values(currentOrder).filter(
  //   item => item !== userDetails
  // );

  const { user_name, phone } = userDetails;
  db.one(`insert into users(user_name, phone) values($1, $2) returning id`, [
    user_name,
    phone
  ])
    .then(data => {
      return db
        .one(
          `insert into orders(id, user_id) values(default, $1) returning id`,
          [data.id]
        )
        .then(order => {
          client.notify
            .services(notifyServiceSid)
            .notifications.create({
              toBinding: JSON.stringify({
                binding_type: "sms",
                address: `${phone}`
              }),
              body: `Hi ${user_name}! Your order (id: ${
                order.id
              }) is accepted. We are preparing your food.`
            })
            .then(notification => console.log(notification.sid))
            .catch(error => console.log(error.message));

          return Promise.all(
            Object.values(orderDetails).map(item => {
              const { dish_id, quantity } = item;

              return db.none(
                `insert into dishes_orders(dish_id, order_id, quantity)
            VALUES($1, $2, $3)`,
                [dish_id, order.id, quantity]
              );
            })
          ).then(() => order.id);
        });
    })
    .then(orderId => res.json({ order: orderObject, order_id: orderId }))
    .catch(error => res.status(400).json({ error: error.message }));
});

const port = process.env.PORT || 8080;
app.listen(port, function() {
  console.log(`Listening on port number ${port}`);
});
