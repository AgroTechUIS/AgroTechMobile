import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';

import '../domain/models/pest_response_model.dart';

class PestState {
  final List<dynamic> plagas;
  final PlagaResponseModel? selectedPlagaForEdit;

  PestState({
    this.plagas = const [],
    this.selectedPlagaForEdit,
  });

  PestState copyWith({
    List<dynamic>? plagas,
    PlagaResponseModel? selectedPlagaForEdit,
  }) {
    return PestState(
      plagas: plagas ?? this.plagas,
      selectedPlagaForEdit: selectedPlagaForEdit ?? this.selectedPlagaForEdit,
    );
  }
}
