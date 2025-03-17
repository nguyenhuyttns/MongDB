const app = require('./app');
const db = require('./config/db')
const UserModel = require('./model/user.model')
const ToDoModel = require('./model/todo.model')
const ProductModel = require('./model/product.model')


const port = 3000;

app.get('/', (req, res) => {
    res.send("hello world!abc");
});

app.listen(port, () => {
    console.log(`Server listening on Port http://localhost:${port}`);
});

