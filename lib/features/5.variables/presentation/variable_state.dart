// coverage:ignore-file
import 'package:agrotech/features/5.variables/domain/models/variable_response_model.dart';

class VariableState {
  final List<VariableResponseModel> variables;
  VariableResponseModel? selectedVariableForEdit;

  VariableState({
    this.variables = const [],
    this.selectedVariableForEdit,
  });

  VariableState copyWith({
    List<VariableResponseModel>? variables,
    VariableResponseModel? selectedVariableForEdit,
  }) {
    return VariableState(
      variables: variables ?? this.variables,
      selectedVariableForEdit: selectedVariableForEdit ?? this.selectedVariableForEdit,
    );
  }
}
