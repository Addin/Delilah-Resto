const express = require('express');
const users = require('./users');
const dishes = require('./dishes');
const orders = require('./orders');
const app = express();
app.use('/users', users);
app.use('/dishes', dishes);
app.use('/orders', orders);
module.exports = app;
