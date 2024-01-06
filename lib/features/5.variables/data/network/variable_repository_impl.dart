import 'package:agrotech/features/5.variables/data/network/variable_repository.dart';
import 'package:agrotech/features/5.variables/domain/models/variable_response_model.dart';

class VariableRepositoryImpl implements VariableRepository {
  final VariableRepository variableRepository;

  VariableRepositoryImpl(this.variableRepository);

  @override
  Future<List<VariableResponseModel>?> getVariableByCrop(int idCrop) async {
    return null;

    // Implementa la lógica para obtener las plagas utilizando pestService
  }
}
