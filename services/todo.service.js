const ToDoModel = require('../model/todo.model');

class ToDoServices{
    static async createTodo(userId,title,desc){
        const createTodo = new ToDoModel({userId,title,desc});
        return await createTodo.save();
    }
}

module.exports = ToDoServices;