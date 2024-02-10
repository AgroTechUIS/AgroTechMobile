// coverage:ignore-file
import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';
import 'package:agrotech/features/4.products/domain/models/categorie_model.dart';

import '../../4.discounts/domain/models/discount_model.dart';
import '../domain/models/product_response_model.dart';

class ProductState {
  final List<ProductResponseModel> productos;
  ProductResponseModel? selectedProductForEdit;
  final List<CategoryModel> categorias;
  CategoryModel? selectedCategorie;
  final List<CropResponseModel> cultivos;
  CropResponseModel? selectedCrop;
  final List<DiscountModel> descuentos;
  DiscountModel? selectedDiscount;

  ProductState(
      {this.productos = const [],
      this.categorias = const [],
      this.cultivos = const [],
      this.descuentos = const [],
      this.selectedCategorie,
      this.selectedProductForEdit,
      this.selectedCrop,
      this.selectedDiscount});

  ProductState copyWith({
    List<ProductResponseModel>? productos,
    List<CategoryModel>? categorias,
    List<CropResponseModel>? cultivos,
    List<DiscountModel>? descuentos,
    ProductResponseModel? selectedProductForEdit,
    CategoryModel? selectedCategorie,
    CropResponseModel? selectedCrop,
    DiscountModel? selectedDiscount,
    bool? clearCategory,
    bool? clearCrop,
    bool? clearDiscount,
  }) {
    return ProductState(
        productos: productos ?? this.productos,
        categorias: categorias ?? this.categorias,
        cultivos: cultivos ?? this.cultivos,
        descuentos: descuentos ?? this.descuentos,
        selectedProductForEdit:
            selectedProductForEdit ?? this.selectedProductForEdit,
        selectedCategorie: (clearCategory ?? false)
            ? null
            : (selectedCategorie ?? this.selectedCategorie),
        selectedCrop:
            (clearCrop ?? false) ? null : (selectedCrop ?? this.selectedCrop),
        selectedDiscount: (clearDiscount ?? false)
            ? null
            : (selectedDiscount ?? this.selectedDiscount));
  }
}
