import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';

import '../domain/models/crop_response_model.dart';

class CropState {
  final List<dynamic> cultivos;
  CropResponseModel? selectedCropForEdit;

  CropState({
    this.cultivos = const [],
    this.selectedCropForEdit,
  });

  CropState copyWith({
    List<dynamic>? cultivos,
    CropResponseModel? selectedCropForEdit,
  }) {
    return CropState(
      cultivos: cultivos ?? this.cultivos,
      selectedCropForEdit: selectedCropForEdit ?? this.selectedCropForEdit,
    );
  }
}
