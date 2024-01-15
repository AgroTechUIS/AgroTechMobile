import 'package:agrotech/features/6.medidas/domain/models/measure_response_model.dart';

class MeasureState {
  final List<MeasureResponseModel> medidas;
  MeasureResponseModel? selectedMeasureForEdit;

  MeasureState({
    this.medidas = const [],
    this.selectedMeasureForEdit,
  });

  MeasureState copyWith({
    List<MeasureResponseModel>? medidas,
    MeasureResponseModel? selectedMeasureForEdit,
  }) {
    return MeasureState(
      medidas: medidas ?? this.medidas,
      selectedMeasureForEdit:
          selectedMeasureForEdit ?? this.selectedMeasureForEdit,
    );
  }
}
