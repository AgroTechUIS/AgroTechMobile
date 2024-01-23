// coverage:ignore-file
import 'package:agrotech/features/6.medidas/data/network/measure_repository_impl.dart';
import 'package:agrotech/features/6.medidas/data/network/measure_service.dart';
import 'package:agrotech/features/6.medidas/domain/models/measure_response_model.dart';
import 'package:agrotech/features/6.medidas/domain/use_cases/get_measure_use_case_impl.dart';
import 'package:agrotech/features/6.medidas/presentation/measure_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MeasureController extends StateNotifier<MeasureState> {
  MeasureController(this.getMeasureUseCaseImpl) : super(MeasureState());

  // Use cases
  final GetMeasureUseCaseImpl getMeasureUseCaseImpl;

  Future<List<MeasureResponseModel>> getListMeasure(int variable) async {
    var resp = await getMeasureUseCaseImpl.getListMeasure(idVariable: variable);
    state = state.copyWith(medidas: resp);
    return resp;
  }

  Future<Map<String, dynamic>> updatesMeasures(
      MeasureResponseModel? updatedMeasures, MeasureResponseModel? initialMeasure, int idVariable) async {
    if (updatedMeasures == null || initialMeasure == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    MeasureResponseModel updatedInitialMeasure = MeasureResponseModel(
        id: updatedMeasures.id,
        measurement_value: updatedMeasures.measurement_value ?? initialMeasure.measurement_value,
        description: updatedMeasures.description ?? initialMeasure.description,
        measuring_unit: updatedMeasures.measuring_unit ?? initialMeasure.measuring_unit,
        date: updatedMeasures.date ?? initialMeasure.date,
        variable: idVariable);

    var resp = await getMeasureUseCaseImpl.updateMeasure(updatedInitialMeasure);

    final selectedMeasure = MeasureResponseModel.fromJson(resp);
    state = state.copyWith(selectedMeasureForEdit: selectedMeasure);

    return resp;
  }

  void saveMeasures(MeasureResponseModel? savedMeasures, int variable) async {
    MeasureResponseModel savedMeasure = MeasureResponseModel(
        id: savedMeasures!.id,
        measurement_value: savedMeasures.measurement_value ?? 0,
        description: savedMeasures.description ?? '',
        date: savedMeasures.date ?? DateTime.now(),
        measuring_unit: savedMeasures.measuring_unit ?? '',
        variable: variable);

    var resp = await getMeasureUseCaseImpl.saveMeasure(savedMeasure);

    final selectedMeasure = MeasureResponseModel.fromJson(resp);
    state.medidas.add(selectedMeasure);
    state = state.copyWith(medidas: state.medidas);
  }

  void deleteMeasure(MeasureResponseModel medida) async {
    var resp = await getMeasureUseCaseImpl.deleteMeasure(medida.id);

    var temp = state.medidas;
    temp.remove(state.selectedMeasureForEdit);
    state = state.copyWith(medidas: temp);
    print(resp);
  }

  void saveNewMeasure(MeasureResponseModel medida) {
    var temp = state.medidas;
    temp.add(medida);
    state = state.copyWith(medidas: temp);
  }

  void updateMeasure(MeasureResponseModel? medida) {
    var temp = state.medidas;
    state.selectedMeasureForEdit = medida;
    state = state.copyWith(medidas: temp, selectedMeasureForEdit: medida);
  }

  void edit(MeasureResponseModel? medida) {
    var temp = state.medidas;
    temp.remove(state.selectedMeasureForEdit);
    temp.add(medida!);
    state = state.copyWith(medidas: temp);
  }
}

final measureController = StateNotifierProvider<MeasureController, MeasureState>(
    (ref) => MeasureController(GetMeasureUseCaseImpl(MeasureRepositoryImpl(MeasureService()))));
