import 'package:agrotech/plagas/data/network/plagas_service.dart';
import 'package:agrotech/variables/domain/models/variables_model.dart';
import 'package:agrotech/variables/domain/models/variables_response_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

abstract class VariablesUseCase {
  Future<VariablesResponseModel> login({required Variables variablesModel});
}
