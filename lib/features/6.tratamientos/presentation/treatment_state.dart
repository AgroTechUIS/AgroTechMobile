// coverage:ignore-file
import 'package:agrotech/features/6.tratamientos/domain/models/treatment_response_model.dart';

class TreatmentState {
  final List<TreatmentResponseModel> tratamientos;
  TreatmentResponseModel? selectedTreatmentForEdit;

  TreatmentState({
    this.tratamientos = const [],
    this.selectedTreatmentForEdit,
  });

  TreatmentState copyWith({
    List<TreatmentResponseModel>? tratamientos,
    TreatmentResponseModel? selectedTreatmentForEdit,
  }) {
    return TreatmentState(
      tratamientos: tratamientos ?? this.tratamientos,
      selectedTreatmentForEdit: selectedTreatmentForEdit ?? this.selectedTreatmentForEdit,
    );
  }
}
