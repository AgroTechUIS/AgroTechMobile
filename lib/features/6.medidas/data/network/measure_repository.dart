import 'package:agrotech/features/6.medidas/domain/models/measure_response_model.dart';

abstract class MeasureRepository {
  Future<List<MeasureResponseModel>?> getMeasureByVariable(int idVariable);
}
