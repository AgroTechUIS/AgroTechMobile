// coverage:ignore-file
import '../../data/network/measure_repository_impl.dart';
import '../models/measure_response_model.dart';
import '../models/measure_response_model.dart';

abstract class GetMeasureUseCase {
  Future<List<MeasureResponseModel>?> getListMeasure({required int idVariable});
}

class GetMeasureUseCaseImpl extends GetMeasureUseCase {
  final MeasureRepository measureRepository;

  GetMeasureUseCaseImpl(
    this.measureRepository,
  );

  @override
  Future<List<MeasureResponseModel>> getListMeasure({required int idVariable}) async {
    try {
      final measureData = await measureRepository.getMeasureByVariable(idVariable);
      List<MeasureResponseModel> listMeasures = [];

      for (var entry in measureData!['variablesValue']) {
        listMeasures.add(MeasureResponseModel.fromJson(entry));
      }
      return listMeasures;
    } catch (e) {
      throw ('Error al obtener la lista de medidas: $e');
    }
  }

  Future<Map<String, dynamic>> updateMeasure(MeasureResponseModel? updateMeasures) async {
    try {
      final measureData = updateMeasures!.toJson();
      var r = await measureRepository.updateMeasureDataRep(measureData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de medidas: $e');
    }
  }

  Future<Map<String, dynamic>> saveMeasure(MeasureResponseModel? savedMeasures) async {
    try {
      final measureData = savedMeasures!.toJsonPost();
      var s = await measureRepository.saveMeasureDataRep(measureData);
      return s;
    } catch (e) {
      throw ('Error al guardar la medida: $e');
    }
  }

  Future<String> deleteMeasure(int? idMeasure) async {
    try {
      var d = await measureRepository.deleteMeasuresById(idMeasure);
      return d;
    } catch (e) {
      throw ('Error al borrar la medida: $e');
    }
  }
}
