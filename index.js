const app = require('./app');
const db = require('./config/db')
const port = 3000;

app.get('/', (req, res) => {
    res.send("hello world!!!!!!1");
});

app.listen(port, () => {
    console.log(`Server listening on Port http://localhost:${port}`);
});

