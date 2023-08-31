import 'package:agrotech/features/5.variables/domain/models/variable_response_model.dart';

abstract class VariableRepository {
  Future<List<VariableResponseModel>?> getVariableByCrop(int idCrop);
}
