import 'package:agrotech/plagas/data/network/plagas_service.dart';
import 'package:agrotech/plagas/domain/models/plagas_model.dart';
import 'package:agrotech/plagas/domain/models/plagas_response_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

abstract class PlagasUseCase {
  Future<PlagasResponseModel> login({required Plaga plagasModel});
}
