import '../models/measure_response_model.dart';

abstract class GetMeasureUseCase {
  Future<List<MeasureResponseModel>?> getListMeasure({required int idVariable});
}
