import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';
import 'package:agrotech/features/5.tratamientos/domain/models/treatment_response_model.dart';
import 'package:agrotech/features/5.variables/data/network/variable_service.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

import '../models/variable_response_model.dart';

abstract class GetVariableUseCase {
  Future<List<VariableResponseModel>?> getListVariable({required int idCrop});
}

class GetVariableUseCaseImpl extends GetVariableUseCase {
  final VariableService variableService;

  GetVariableUseCaseImpl(
    this.variableService,
  );

  @override
  Future<List<VariableResponseModel>?> getListVariable({required int idCrop}) {
    // TODO: implement getListPest
    throw UnimplementedError();
  }
}
