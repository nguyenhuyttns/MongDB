const express = require('express');
const body_parser = require('body-parser');
const userRouter = require('./routers/user.router');
const ToDoRouter = require('./routers/todo.router');
const ProductRouter = require('./routers/product.routes');

const app = express();

app.use(body_parser.json());

app.use('/api/users',userRouter);
app.use('/api/todos',ToDoRouter);
app.use('/api/products',ProductRouter);

module.exports = app;
