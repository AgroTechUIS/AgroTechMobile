// coverage:ignore-file
import 'package:agrotech/features/4.products/data/network/product_service.dart';

abstract class ProductRepository {
  Future<Map<String, dynamic>> getProductsByEmpresa(int idCrop); // ??

  Future<String> deleteProductsById(int? productId);

  Future<Map<String, dynamic>> saveProductDataRep(Map<String, dynamic> productData, {required int idEmpresa});
  Future<Map<String, dynamic>> updateProductsDataRep(Map<String, dynamic> pestData);
  Future<Map<String, dynamic>> getCategories();
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductService productService;

  ProductRepositoryImpl(this.productService);

  @override
  Future<Map<String, dynamic>> getProductsByEmpresa(int idEmpresa) async {
    try {
      final productData = await productService.getProducts(idEmpresa: idEmpresa);
      if (productData.success) {
        return productData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los productos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getCategories() async {
    try {
      final categoryData = await productService.getCategories();
      if (categoryData.success) {
        return categoryData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de las categorias: $e');
    }
  }

  Future<Map<String, dynamic>> updateProductsDataRep(Map<String, dynamic> productData) async {
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

  Future<Map<String, dynamic>> saveProductDataRep(Map<String, dynamic> productData, {required int idEmpresa}) async {
    try {
      final response = await productService.saveProductData(productData, idEmpresa: idEmpresa);

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
