const express = require('express');
const router = express.Router();
const ProductController = require('../controller/product.controller');

// Thêm sản phẩm
router.post('/storeProduct', ProductController.createProduct);

// Lấy tất cả sản phẩm của một người dùng
// Lấy tất cả sản phẩm theo ID người dùng (sử dụng GET)
router.get('/getAllProductsByUserId', ProductController.getAllProductsByUserId);

// Cập nhật sản phẩm
router.post('/updateProduct', ProductController.updateProduct);

// Xóa sản phẩm
router.post('/deleteProduct', ProductController.deleteProduct);

module.exports = router;