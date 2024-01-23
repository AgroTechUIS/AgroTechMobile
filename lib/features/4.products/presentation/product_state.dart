// coverage:ignore-file
import 'package:agrotech/features/4.products/domain/models/categorie_model.dart';

import '../domain/models/product_response_model.dart';

class ProductState {
  final List<ProductResponseModel> productos;
  ProductResponseModel? selectedProductForEdit;
  final List<CategoryModel> categorias;
  CategoryModel? selectedCategorie;

  ProductState({
    this.productos = const [],
    this.categorias = const [],
    this.selectedCategorie,
    this.selectedProductForEdit,
  });

  ProductState copyWith({
    List<ProductResponseModel>? productos,
    List<CategoryModel>? categorias,
    ProductResponseModel? selectedProductForEdit,
    CategoryModel? selectedCategorie,
  }) {
    return ProductState(
      productos: productos ?? this.productos,
      categorias: categorias ?? this.categorias,
      selectedCategorie: selectedCategorie ?? this.selectedCategorie,
      selectedProductForEdit: selectedProductForEdit ?? this.selectedProductForEdit,
    );
  }
}
