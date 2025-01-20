const ToDoModel = require('../model/todo.model');

class ToDoServices{
    static async createTodo(userId,title,desc){
        const createTodo = new ToDoModel({userId,title,desc});
        return await createTodo.save();
    }

    static async getTododata(userId){
        const tododata = await ToDoModel.find({userId});
        return tododata;
    }

    static async deleteTododata(id){
        const deleted = await ToDoModel.findOneAndDelete({_id:id})
        return deleted;
    }
}

module.exports = ToDoServices;
