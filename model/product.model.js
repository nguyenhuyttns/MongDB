const db = require('../config/db');
const mongoose = require('mongoose');
const UserModel = require('../model/user.model');
const { Schema } = mongoose;

// Định nghĩa schema cho sản phẩm
const productSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: UserModel.modelName, // Liên kết với model User
        required: true,
    },
    name: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    price: {
        type: Number,
        required: true,
    },
    quantity: {
        type: Number,
        required: true,
    },
}, { timestamps: true }); // Thêm timestamps để theo dõi thời gian tạo và cập nhật

// Tạo model từ schema
const ProductModel = db.model('Product', productSchema);

module.exports = ProductModel;