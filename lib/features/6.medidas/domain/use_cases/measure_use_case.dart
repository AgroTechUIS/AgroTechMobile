import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';
import 'package:agrotech/features/5.tratamientos/domain/models/treatment_response_model.dart';
import 'package:agrotech/features/5.variables/data/network/variable_service.dart';
import 'package:agrotech/features/6.medidas/data/network/measure_service.dart';
import 'package:agrotech/features/6.medidas/domain/models/measure_response_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

abstract class GetMeasureUseCase {
  Future<List<MeasureResponseModel>?> getListMeasure({required int idVariable});
}

class GetMeasureUseCaseImpl extends GetMeasureUseCase {
  final MeasureService measureService;

  GetMeasureUseCaseImpl(
    this.measureService,
  );

  @override
  Future<List<MeasureResponseModel>?> getListMeasure(
      {required int idVariable}) {
    // TODO: implement getListPest
    throw UnimplementedError();
  }
}
