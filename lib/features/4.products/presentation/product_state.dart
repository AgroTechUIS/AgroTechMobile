import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';
import 'package:agrotech/features/4.products/domain/models/categorie_model.dart';

import '../domain/models/product_response_model.dart';

class ProductState {
  final List<ProductResponseModel> productos;
  ProductResponseModel? selectedProductForEdit;
  final List<CategoryModel> categorias;
  CategoryModel? selectedCategorie;
  final List<CropResponseModel> cultivos;
  CropResponseModel? selectedCrop;

  ProductState({
    this.productos = const [],
    this.categorias = const [],
    this.cultivos = const [],
    this.selectedCategorie,
    this.selectedProductForEdit,
    this.selectedCrop,
  });

  ProductState copyWith(
      {List<ProductResponseModel>? productos,
      List<CategoryModel>? categorias,
      List<CropResponseModel>? cultivos,
      ProductResponseModel? selectedProductForEdit,
      CategoryModel? selectedCategorie,
      bool? clearCategory,
      bool? clearCrop}) {
    return ProductState(
        productos: productos ?? this.productos,
        categorias: categorias ?? this.categorias,
        selectedProductForEdit:
            selectedProductForEdit ?? this.selectedProductForEdit,
        selectedCategorie: (clearCategory ?? false)
            ? null
            : (selectedCategorie ?? this.selectedCategorie),
        selectedCrop:
            (clearCrop ?? false) ? null : (selectedCrop ?? this.selectedCrop));
  }
}
