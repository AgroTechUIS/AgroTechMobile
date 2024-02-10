// coverage:ignore-file
import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';
import 'package:agrotech/features/4.products/domain/models/categorie_model.dart';
import 'package:agrotech/features/4.products/domain/models/product_response_model.dart';

import '../../../4.discounts/domain/models/discount_model.dart';
import '../../data/network/product_repository_impl.dart';

abstract class GetProductUseCase {
  Future<List<ProductResponseModel>?> getListProducts({required int idEmpresa});
}

class GetProductUseCaseImpl extends GetProductUseCase {
  final ProductRepositoryImpl productRepository;

  GetProductUseCaseImpl(
    this.productRepository,
  );

  @override
  Future<List<ProductResponseModel>?> getListProducts(
      {required int idEmpresa}) async {
    try {
      var productData = await productRepository.getProductsByEmpresa(idEmpresa);
      List<ProductResponseModel>? listProducts = [];

      for (var entry in productData['products']) {
        listProducts.add(ProductResponseModel.fromJson(entry));
      }
      return listProducts;
    } catch (e) {
      throw ('Error al obtener la lista de productos: $e');
    }
  }

  Future<List<CategoryModel>?> getListCategories() async {
    try {
      var categoryData = await productRepository.getCategories();
      List<CategoryModel>? listCategories = [];

      for (var entry in categoryData["categories"]) {
        listCategories.add(CategoryModel.fromJson(entry));
      }
      return listCategories;
    } catch (e) {
      throw ('Error al obtener la lista de categorias: $e');
    }
  }

  Future<List<CropResponseModel>?> getListCrops(
      {required int idEmpresa}) async {
    try {
      var cropData = await productRepository.getCrops(idEmpresa);
      List<CropResponseModel>? listCrops = [];

      for (var entry in cropData["crops"]) {
        listCrops.add(CropResponseModel.fromJson(entry));
      }
      return listCrops;
    } catch (e) {
      throw ('Error al obtener la lista de cultivos: $e');
    }
  }

  Future<Map<String, dynamic>> updateProduct(
      ProductResponseModel? updatedProducts) async {
    try {
      final productData = updatedProducts!.toJsonPut(); //toJsonEdit
      var r = await productRepository.updateProductsDataRep(productData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de productos: $e');
    }
  }

  Future<String> deleteProduct(int? idProduct) async {
    try {
      var d = await productRepository.deleteProductsById(idProduct);
      return d;
    } catch (e) {
      throw ('Error al borrar el producto: $e');
    }
  }

  Future<Map<String, dynamic>> saveProduct(
      ProductResponseModel? savedProductos, int idEmpresa) async {
    try {
      final productData = savedProductos!.toJsonPost();
      var s = await productRepository.saveProductDataRep(productData,
          idEmpresa: idEmpresa);
      return s;
    } catch (e) {
      throw ('Error al guardar el producto: $e');
    }
  }

  @override
  Future<List<DiscountModel>?> getListDiscounts(
      {required int idEmpresa}) async {
    try {
      var discountData =
          await productRepository.getDiscountsByEmpresa(idEmpresa);
      List<DiscountModel>? listDiscounts = [];

      for (var entry in discountData['discounts']) {
        listDiscounts.add(DiscountModel.fromJson(entry));
      }
      return listDiscounts;
    } catch (e) {
      throw ('Error al obtener la lista de descuentos: $e');
    }
  }
}
