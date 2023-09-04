import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';

class PestState {
  final List<dynamic> plagas;
  final PlagaModel? selectedPlagaForEdit;

  PestState({
    this.plagas = const [],
    this.selectedPlagaForEdit,
  });

  PestState copyWith({
    List<dynamic>? plagas,
    PlagaModel? selectedPlagaForEdit,
  }) {
    return PestState(
      plagas: plagas ?? this.plagas,
      selectedPlagaForEdit: selectedPlagaForEdit ?? this.selectedPlagaForEdit,
    );
  }
}
