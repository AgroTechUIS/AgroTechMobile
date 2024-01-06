import 'package:agrotech/features/5.products/data/network/product_service.dart';

abstract class ProductRepository {
  Future<Map<String, dynamic>> getProductsByEmail(String userEmail); // ??

  Future<String> deleteProductsById(int? productId);

  Future<Map<String, dynamic>> saveProductDataRep(
      Map<String, dynamic> cropData);
  Future<Map<String, dynamic>> updateProductsDataRep(
      Map<String, dynamic> pestData);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductService productService;

  ProductRepositoryImpl(this.productService);

  @override
  Future<Map<String, dynamic>> getProductsByEmail(String userEmail) async {
    try {
      final productData =
          await productService.getProducts(userEmail: userEmail);
      if (productData.success) {
        return productData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los productos: $e');
    }
  }

  Future<Map<String, dynamic>> updateProductsDataRep(
      Map<String, dynamic> productData) async {
    try {
      final response = await productService.updateProductData(productData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos del producto: $e');
    }
  }

  Future<String> deleteProductsById(int? productId) async {
    try {
      final productData = await productService.deleteProductData(productId);
      if (productData.success) {
        return productData.message ?? 'Producto borrado';
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al borrar datos del producto: $e');
    }
  }

  Future<Map<String, dynamic>> saveProductDataRep(
      Map<String, dynamic> productData) async {
    try {
      final response = await productService.saveProductData(productData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al guardar datos del producto: $e');
    }
  }
}
