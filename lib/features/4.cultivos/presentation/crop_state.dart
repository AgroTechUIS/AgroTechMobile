// coverage:ignore-file
import 'package:agrotech/features/4.cultivos/domain/models/plant_model.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';

import '../../3.opciones_supervisor/domain/models/crops_response_model.dart';
import '../domain/models/crop_response_model.dart';

class CropState {
  final List<CropResponseModel> cultivos;
  final List<PlantResponseModel> plants;
  CropResponseModel? selectedCropForEdit;

  PlantResponseModel? selectedPlant;

  CropState({
    this.plants = const [],
    this.cultivos = const [],
    this.selectedCropForEdit,
    this.selectedPlant,
  });

  CropState copyWith({
    List<CropResponseModel>? cultivos,
    List<PlantResponseModel>? plants,
    CropResponseModel? selectedCropForEdit,
    PlantResponseModel? selectedPlant,
    bool? clearPlant,
  }) {
    return CropState(
      cultivos: cultivos ?? this.cultivos,
      plants: plants ?? this.plants,
      selectedCropForEdit: selectedCropForEdit ?? this.selectedCropForEdit,
      selectedPlant: (clearPlant ?? false) ? null : (selectedPlant ?? this.selectedPlant),
    );
  }
}
