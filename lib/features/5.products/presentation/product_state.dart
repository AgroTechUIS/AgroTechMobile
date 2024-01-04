import '../domain/models/product_response_model.dart';

class ProductState {
  final List<dynamic> productos;
  ProductResponseModel? selectedProductForEdit;

  ProductState({
    this.productos = const [],
    this.selectedProductForEdit,
  });

  ProductState copyWith({
    List<dynamic>? productos,
    ProductResponseModel? selectedProductForEdit,
  }) {
    return ProductState(
      productos: productos ?? this.productos,
      selectedProductForEdit:
          selectedProductForEdit ?? this.selectedProductForEdit,
    );
  }
}
