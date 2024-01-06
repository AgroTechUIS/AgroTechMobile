import 'package:agrotech/features/6.medidas/data/network/measure_repository.dart';

import '../models/measure_response_model.dart';
import 'get_measure_use_case.dart';

class GetMeasureUseCaseImpl extends GetMeasureUseCase {
  final MeasureRepository measureRepository;

  GetMeasureUseCaseImpl(
    this.measureRepository,
  );

  @override
  Future<List<MeasureResponseModel>?> getListMeasure(
      {required int idVariable}) {
    // TODO: implement getListPest
    throw UnimplementedError();
  }
}
