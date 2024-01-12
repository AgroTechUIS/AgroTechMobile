import 'package:agrotech/features/5.variables/data/network/variable_service.dart';
import 'package:agrotech/features/5.variables/domain/models/variable_response_model.dart';

abstract class VariableRepository {
  Future<Map<String, dynamic>> getVariablesByCrop(int idCrop);
  Future<Map<String, dynamic>> updateVariableDataRep(
      Map<String, dynamic> variableData);
  Future<Map<String, dynamic>> saveVariableDataRep(
      Map<String, dynamic> variableData);
  Future<String> deleteVariablesById(int? idVariable);
}

class VariableRepositoryImpl implements VariableRepository {
  final VariableService variableService;

  VariableRepositoryImpl(this.variableService);

  @override
  Future<Map<String, dynamic>> getVariablesByCrop(int idCrop) async {
    try {
      final variableData = await variableService.getVariableData(idCrop);
      if (variableData.success) {
        return variableData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de las variables: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateVariableDataRep(
      Map<String, dynamic> variableData) async {
    try {
      final response = await variableService.updateVariableData(variableData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos de la variable: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> saveVariableDataRep(
      Map<String, dynamic> variableData) async {
    try {
      final response = await variableService.saveVariableData(variableData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al guardar datos de la variable: $e');
    }
  }

  Future<String> deleteVariablesById(int? idVariable) async {
    try {
      final variableData = await variableService.deleteVariableData(idVariable);
      if (variableData.success) {
        return variableData.message ?? 'Variable borrada';
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al borrar datos de la variable: $e');
    }
  }
}
