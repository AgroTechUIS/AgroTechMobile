import 'package:agrotech/features/5.variables/data/network/variable_repository.dart';

import '../models/variable_response_model.dart';
import 'get_variable_use_case.dart';

class GetVariableUseCaseImpl extends GetVariableUseCase {
  final VariableRepository variableRepository;

  GetVariableUseCaseImpl(
    this.variableRepository,
  );

  @override
  Future<List<VariableResponseModel>?> getListVariable({required int idCrop}) {
    // TODO: implement getListPest
    throw UnimplementedError();
  }
}
