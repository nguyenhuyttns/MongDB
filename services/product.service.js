const ProductModel = require('../model/product.model');

class ProductService {
    // Thêm sản phẩm mới
    static async createProduct(userId, name, description, price, quantity) {
        const product = new ProductModel({ userId, name, description, price, quantity });
        return await product.save();
    }

    // Lấy tất cả sản phẩm của một người dùng (theo userId)
    static async getAllProductsByUserId(userId) {
        const products = await ProductModel.find({ userId });
        return products;
    }

    // Cập nhật sản phẩm
    static async updateProduct(userId, id, updates) {
        const updatedProduct = await ProductModel.findOneAndUpdate(
            { _id: id, userId }, // Đảm bảo chỉ cập nhật sản phẩm thuộc về người dùng này
            { $set: updates },
            { new: true } // Trả về sản phẩm sau khi cập nhật
        );
        if (!updatedProduct) {
            throw new Error("Product not found or does not belong to this user");
        }
        return updatedProduct;
    }

    // Xóa sản phẩm
    static async deleteProduct(userId, id) {
        const deletedProduct = await ProductModel.findOneAndDelete({ _id: id, userId });
        if (!deletedProduct) {
            throw new Error("Product not found or does not belong to this user");
        }
        return deletedProduct;
    }
}

module.exports = ProductService;