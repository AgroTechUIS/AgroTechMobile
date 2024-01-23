// coverage:ignore-file
import '../../data/network/variable_repository_impl.dart';
import '../models/variable_response_model.dart';

abstract class GetVariableUseCase {
  Future<List<VariableResponseModel>?> getListVariables({required int idCrop});
}

class GetVariableUseCaseImpl extends GetVariableUseCase {
  final VariableRepository variableRepository;

  GetVariableUseCaseImpl(
    this.variableRepository,
  );

  @override
  Future<List<VariableResponseModel>> getListVariables({required int idCrop}) async {
    try {
      var variableData = await variableRepository.getVariablesByCrop(idCrop);
      List<VariableResponseModel>? listVariables = [];

      for (var entry in variableData['variables']) {
        listVariables.add(VariableResponseModel.fromJson(entry));
      }
      return listVariables;
    } catch (e) {
      throw ('Error al obtener la lista de variables: $e');
    }
  }

  Future<Map<String, dynamic>> updateVariable(VariableResponseModel? updatedVariables) async {
    try {
      final variableData = updatedVariables!.toJsonEdit();
      var r = await variableRepository.updateVariableDataRep(variableData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de variables: $e');
    }
  }

  Future<String> deleteVariable(int? idVariable) async {
    try {
      var d = await variableRepository.deleteVariablesById(idVariable);
      return d;
    } catch (e) {
      throw ('Error al borrar la variable: $e');
    }
  }

  Future<Map<String, dynamic>> saveVariable(VariableResponseModel? savedVariables) async {
    try {
      final variableData = savedVariables!.toJsonPost();
      var s = await variableRepository.saveVariableDataRep(variableData);
      return s;
    } catch (e) {
      throw ('Error al guardar la variable: $e');
    }
  }
}
