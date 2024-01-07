import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';

import '../../3.opciones_supervisor/domain/models/crops_response_model.dart';
import '../domain/models/crop_response_model.dart';

class CropState {
  final List<CropResponseModel> cultivos;
  CropResponseModel? selectedCropForEdit;

  CropState({
    this.cultivos = const [],
    this.selectedCropForEdit,
  });

  CropState copyWith({
    List<CropResponseModel>? cultivos,
    CropResponseModel? selectedCropForEdit,
  }) {
    return CropState(
      cultivos: cultivos ?? this.cultivos,
      selectedCropForEdit: selectedCropForEdit ?? this.selectedCropForEdit,
    );
  }
}
