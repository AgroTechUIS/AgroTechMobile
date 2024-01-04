import 'package:agrotech/features/5.products/domain/models/product_response_model.dart';
import 'package:agrotech/features/5.products/presentation/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/network/product_repository_impl.dart';
import '../data/network/product_service.dart';
import '../domain/use_cases/get_product_use_case_impl.dart';

class ProductController extends StateNotifier<ProductState> {
  ProductController(this.getProductUseCaseImpl) : super(ProductState()) {
    getListProduct("jorgesandoval529@gmail.com");
  }

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
        .any((producto) => producto.name.toLowerCase() == nombreLowerCase);
  }

  bool existeProductoEConNombre(
      String nombre, ProductResponseModel productoEditar) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.productos
        .where((producto) =>
            producto.id !=
            productoEditar.id) // Excluir la plaga que estás editando por su ID
        .any((producto) => producto.name.toLowerCase() == nombreLowerCase);
  }

  void updateProduct(ProductResponseModel? producto) {
    var temp = state.productos;
    state.selectedProductForEdit = producto;
    state = state.copyWith(productos: temp, selectedProductForEdit: producto);
  }

  void saveProducts(ProductResponseModel? savedProductos) async {
    ProductResponseModel savedProducto = ProductResponseModel(
      id: savedProductos!.id,
      name: savedProductos.name,
      summary: savedProductos.summary,
      category: savedProductos.category,
      price: savedProductos.price,
      stock: savedProductos.stock,
    );

    var resp = await getProductUseCaseImpl.saveProduct(savedProducto);

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
        name: updatedProductos.name ?? updatedProductos.name,
        summary: updatedProductos.summary ?? updatedProductos.summary,
        category: updatedProductos.category ?? updatedProductos.category,
        price: updatedProductos.price ?? updatedProductos.price,
        stock: updatedProductos.stock ?? updatedProductos.stock);

    var resp =
        await getProductUseCaseImpl.updateProduct(updatedInitialProducto);

    final selectedProduct = ProductResponseModel.fromJson(resp);
    state = state.copyWith(selectedProductForEdit: selectedProduct);

    return resp;
  }

  Future<List<ProductResponseModel>?> getListProduct(String userEmail) async {
    // condicion: si hay internet consulte el servicio

    var resp =
        await getProductUseCaseImpl.getListProducts(userEmail: userEmail);
    state = state.copyWith(productos: resp);
    return resp;
  }
}

final productController =
    StateNotifierProvider<ProductController, ProductState>((ref) =>
        ProductController(
            GetProductUseCaseImpl(ProductRepositoryImpl(ProductService()))));
