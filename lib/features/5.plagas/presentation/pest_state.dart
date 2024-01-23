// coverage:ignore-file
import '../domain/models/pest_response_model.dart';

class PestState {
  final List<PlagaResponseModel> plagas;
  PlagaResponseModel? selectedPlagaForEdit;

  PestState({
    this.plagas = const [],
    this.selectedPlagaForEdit,
  });

  PestState copyWith({
    List<PlagaResponseModel>? plagas,
    PlagaResponseModel? selectedPlagaForEdit,
  }) {
    return PestState(
      plagas: plagas ?? this.plagas,
      selectedPlagaForEdit: selectedPlagaForEdit ?? this.selectedPlagaForEdit,
    );
  }
}
