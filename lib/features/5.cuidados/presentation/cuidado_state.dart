import '../domain/models/cuidado_response_model.dart';

class CuidadoState {
  final List<CareResponseModel> cuidados;
  CareResponseModel? selectedCuidadoForEdit;

  CuidadoState({
    this.cuidados = const [],
    this.selectedCuidadoForEdit,
  });

  CuidadoState copyWith({
    List<CareResponseModel>? cuidados,
    CareResponseModel? selectedCuidadoForEdit,
  }) {
    return CuidadoState(
      cuidados: cuidados ?? this.cuidados,
      selectedCuidadoForEdit:
          selectedCuidadoForEdit ?? this.selectedCuidadoForEdit,
    );
  }
}
