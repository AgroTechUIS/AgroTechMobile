import '../models/variable_response_model.dart';

abstract class GetVariableUseCase {
  Future<List<VariableResponseModel>?> getListVariable({required int idCrop});
}
