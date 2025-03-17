const ProductService = require('../services/product.service');

// Thêm sản phẩm
exports.createProduct = async (req, res, next) => {
    try {
        const { userId, name, description, price, quantity } = req.body;
        const product = await ProductService.createProduct(userId, name, description, price, quantity);
        res.json({ status: true, success: product });
    } catch (error) {
        next(error);
    }
};

// Lấy tất cả sản phẩm theo ID người dùng (sử dụng GET)
exports.getAllProductsByUserId = async (req, res, next) => {
    try {
        const { userId } = req.query; // Nhận userId từ query string
        if (!userId) {
            return res.status(400).json({ status: false, message: "userId is required" });
        }
        const products = await ProductService.getAllProductsByUserId(userId);
        res.json({ status: true, success: products });
    } catch (error) {
        next(error);
    }
};

// Cập nhật sản phẩm
exports.updateProduct = async (req, res, next) => {
    try {
        const { id, userId, ...updates } = req.body; // Nhận id, userId và các trường cần cập nhật
        const updatedProduct = await ProductService.updateProduct(userId, id, updates);
        res.json({ status: true, success: updatedProduct });
    } catch (error) {
        next(error);
    }
};

// Xóa sản phẩm
exports.deleteProduct = async (req, res, next) => {
    try {
        const { id, userId } = req.body; // Nhận id và userId từ body
        const deletedProduct = await ProductService.deleteProduct(userId, id);
        res.json({ status: true, success: deletedProduct });
    } catch (error) {
        next(error);
    }
};