import 'package:agrotech/features/5.variables/domain/models/variable_response_model.dart';
import 'package:agrotech/features/5.variables/presentation/variable_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/network/variable_repository_impl.dart';
import '../data/network/variable_service.dart';
import '../domain/use_cases/get_variable_use_case_impl.dart';

class VariableController extends StateNotifier<VariableState> {
  VariableController(this.getVariableUseCaseImpl) : super(VariableState()) {
    //getListPest();
    //updatesPests(state.plagas);
  }

  // Use cases
  final GetVariableUseCaseImpl getVariableUseCaseImpl;

  Future<List<VariableResponseModel>> getListVariable(int crop) async {
    var resp = await getVariableUseCaseImpl.getListVariables(idCrop: crop);
    state = state.copyWith(variables: resp);
    return resp;
  }

  Future<Map<String, dynamic>> updatesVariables(
      VariableResponseModel? updatedVariables,
      VariableResponseModel? initialVariable,
      int idCrop) async {
    if (updatedVariables == null || initialVariable == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    VariableResponseModel updatedInitialVariable = VariableResponseModel(
      id: updatedVariables.id ?? initialVariable.id,
      name: updatedVariables.name ?? initialVariable.name,
      description: updatedVariables.description ?? initialVariable.description,
      measurement_method: updatedVariables.measurement_method ??
          initialVariable.measurement_method,
      date_init: updatedVariables.date_init ?? initialVariable.date_init,
      measuring_instrument: updatedVariables.measuring_instrument ??
          initialVariable.measuring_instrument,
    );

    var resp =
        await getVariableUseCaseImpl.updateVariable(updatedInitialVariable);

    final selectedVariable = VariableResponseModel.fromJson(resp);
    state = state.copyWith(selectedVariableForEdit: selectedVariable);

    return resp;
  }

  bool existeVariableConNombre(String nombre) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.variables
        .any((variable) => variable.name!.toLowerCase() == nombreLowerCase);
  }

  bool existeVariableEConNombre(
      String nombre, VariableResponseModel variableEditar) {
    final nombreLowerCase = nombre.toLowerCase();
    return state.variables
        .where((variable) => variable.id != variableEditar.id)
        .any((variable) => variable.name!.toLowerCase() == nombreLowerCase);
  }

  void saveVariables(VariableResponseModel? savedVariables, int crop) async {
    VariableResponseModel savedVariable = VariableResponseModel(
      id: savedVariables!.id,
      name: savedVariables.name ?? '',
      description: savedVariables.description ?? '',
      date_init: savedVariables.date_init ?? DateTime.now(),
      measurement_method: savedVariables.measurement_method ?? '',
      measuring_instrument: savedVariables.measuring_instrument ?? '',
      crop: crop,
    );

    var resp = await getVariableUseCaseImpl.saveVariable(savedVariable);

    final selectedVariable = VariableResponseModel.fromJsonPost(resp);
    state.variables.add(selectedVariable);
    state = state.copyWith(variables: state.variables);
  }

  void deleteVariable(VariableResponseModel variable) async {
    var resp = await getVariableUseCaseImpl.deleteVariable(variable.id);

    var temp = state.variables;
    temp.remove(state.selectedVariableForEdit);
    state = state.copyWith(variables: temp);
    print(resp);
  }

  void saveNewVariable(VariableResponseModel variable) {
    var temp = state.variables;
    temp.add(variable);
    state = state.copyWith(variables: temp);
  }

  void updateVariable(VariableResponseModel? variable) {
    var temp = state.variables;
    state.selectedVariableForEdit = variable;
    state = state.copyWith(variables: temp, selectedVariableForEdit: variable);
  }

  void edit(VariableResponseModel? variable) {
    var temp = state.variables;
    temp.remove(state.selectedVariableForEdit);
    temp.add(variable!);
    state = state.copyWith(variables: temp);
  }
}

final variableController =
    StateNotifierProvider<VariableController, VariableState>((ref) =>
        VariableController(
            GetVariableUseCaseImpl(VariableRepositoryImpl(VariableService()))));
