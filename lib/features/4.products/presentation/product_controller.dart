// coverage:ignore-file
import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';
import 'package:agrotech/features/4.products/domain/models/product_response_model.dart';
import 'package:agrotech/features/4.products/presentation/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../4.discounts/domain/models/discount_model.dart';
import '../data/network/product_repository_impl.dart';
import '../data/network/product_service.dart';
import '../domain/models/categorie_model.dart';
import '../domain/use_cases/get_product_use_case_impl.dart';

class ProductController extends StateNotifier<ProductState> {
  ProductController(this.getProductUseCaseImpl) : super(ProductState()) {}

  // Use cases
  final GetProductUseCaseImpl getProductUseCaseImpl;

  void deleteProduct(ProductResponseModel producto) async {
    var resp = await getProductUseCaseImpl.deleteProduct(producto.id);

    var temp = state.productos;
    temp.remove(state.selectedProductForEdit);
    state = state.copyWith(productos: temp);
    print(resp);
  }

  bool existeProductoConNombre(String nombre) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.productos
        .any((producto) => producto.title!.toLowerCase() == nombreLowerCase);
  }

  bool existeProductoEConNombre(
      String nombre, ProductResponseModel productoEditar) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.productos
        .where((producto) =>
            producto.id !=
            productoEditar.id) // Excluir la plaga que estás editando por su ID
        .any((producto) => producto.title!.toLowerCase() == nombreLowerCase);
  }

  void updateProduct(ProductResponseModel? producto) {
    var temp = state.productos;
    state.selectedProductForEdit = producto;
    state = state.copyWith(productos: temp, selectedProductForEdit: producto);
  }

  void updateCategory(CategoryModel? categoria) {
    var temp = state.categorias;
    state.selectedCategorie = categoria;
    state = state.copyWith(categorias: temp, selectedCategorie: categoria);
  }

  void updateCrop(CropResponseModel? cultivo) {
    var temp = state.cultivos;
    state.selectedCrop = cultivo;
    state = state.copyWith(cultivos: temp, selectedCrop: cultivo);
  }

  void updateDiscount(DiscountModel? descuento) {
    var temp = state.descuentos;
    state.selectedDiscount = descuento;
    state = state.copyWith(descuentos: temp, selectedDiscount: descuento);
  }

  void saveProducts(ProductResponseModel? savedProductos, int idEmpresa) async {
    ProductResponseModel savedProducto = ProductResponseModel(
        id: savedProductos!.id,
        title: savedProductos.title,
        resumen: savedProductos.resumen,
        description: savedProductos.description,
        priceCop: savedProductos.priceCop,
        stock: savedProductos.stock,
        sku: savedProductos.sku,
        image: savedProductos.image,
        state: savedProductos.state,
        categorie: savedProductos.categorie,
        crop: savedProductos.crop,
        store: idEmpresa.toString());

    var resp =
        await getProductUseCaseImpl.saveProduct(savedProducto, idEmpresa);

    final selectedProduct = ProductResponseModel.fromJson(resp);
    state.productos.add(selectedProduct);
    state = state.copyWith(productos: state.productos);
  }

  Future<Map<String, dynamic>> updatesProducts(
      ProductResponseModel? updatedProductos,
      ProductResponseModel? initialProducto) async {
    if (updatedProductos == null || initialProducto == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    ProductResponseModel updatedInitialProducto = ProductResponseModel(
        id: updatedProductos.id ?? initialProducto.id,
        title: updatedProductos.title ?? initialProducto.title,
        description:
            updatedProductos.description ?? initialProducto.description,
        resumen: updatedProductos.resumen ?? initialProducto.resumen,
        state: updatedProductos.state,
        categorie: updatedProductos.categorie ?? initialProducto.categorie,
        priceCop: updatedProductos.priceCop ?? initialProducto.priceCop,
        stock: updatedProductos.stock ?? initialProducto.stock,
        sku: updatedProductos.sku ?? initialProducto.sku,
        discount: updatedProductos.discount ?? initialProducto.discount);
    var resp =
        await getProductUseCaseImpl.updateProduct(updatedInitialProducto);

    final selectedProduct = ProductResponseModel.fromJson(resp);
    state = state.copyWith(selectedProductForEdit: selectedProduct);

    return resp;
  }

  Future<List<ProductResponseModel>?> getListProduct(int idEmpresa) async {
    var resp =
        await getProductUseCaseImpl.getListProducts(idEmpresa: idEmpresa);
    state = state.copyWith(productos: resp);
    return resp;
  }

  Future<List<CategoryModel>?> getListCategories() async {
    var resp = await getProductUseCaseImpl.getListCategories();
    state = state.copyWith(categorias: resp, clearCategory: true);
    return resp;
  }

  Future<List<CropResponseModel>?> getListCrops(int idEmpresa) async {
    var resp = await getProductUseCaseImpl.getListCrops(idEmpresa: idEmpresa);
    state = state.copyWith(cultivos: resp, clearCrop: true);
    return resp;
  }

  Future<List<DiscountModel>?> getListDiscounts(int idEmpresa) async {
    var resp =
        await getProductUseCaseImpl.getListDiscounts(idEmpresa: idEmpresa);
    state = state.copyWith(descuentos: resp, clearDiscount: true);
    return resp;
  }
}

final productController =
    StateNotifierProvider<ProductController, ProductState>((ref) =>
        ProductController(
            GetProductUseCaseImpl(ProductRepositoryImpl(ProductService()))));
