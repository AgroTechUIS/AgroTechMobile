import 'package:agrotech/features/6.tratamientos/data/network/treatment_repository_impl.dart';
import 'package:agrotech/features/6.tratamientos/data/network/treatment_service.dart';
import 'package:agrotech/features/6.tratamientos/domain/models/treatment_response_model.dart';
import 'package:agrotech/features/6.tratamientos/domain/use_cases/get_treatment_use_case_impl.dart';
import 'package:agrotech/features/6.tratamientos/presentation/treatment_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreatmentController extends StateNotifier<TreatmentState> {
  TreatmentController(this.getTreatmentUseCaseImpl) : super(TreatmentState()) {}

  final GetTreatmentUseCaseImpl getTreatmentUseCaseImpl;

  Future<List<TreatmentResponseModel>> getListTreatment(int pest) async {
    var resp = await getTreatmentUseCaseImpl.getListTreatment(idPest: pest);
    state = state.copyWith(tratamientos: resp);
    return resp;
  }

  Future<Map<String, dynamic>> updatesTreatments(
      TreatmentResponseModel? updatedTratamientos,
      TreatmentResponseModel? initialTratamiento,
      int idPest) async {
    if (updatedTratamientos == null || initialTratamiento == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    TreatmentResponseModel updatedInitialPlaga = TreatmentResponseModel(
        id: updatedTratamientos.id ?? initialTratamiento.id,
        name: updatedTratamientos.name ?? initialTratamiento.name,
        description:
            updatedTratamientos.description ?? initialTratamiento.description,
        form: updatedTratamientos.form ?? initialTratamiento.form,
        state: updatedTratamientos.state ?? initialTratamiento.state,
        dateStart:
            updatedTratamientos.dateStart ?? initialTratamiento.dateStart,
        dateEnd: updatedTratamientos.dateStart ?? initialTratamiento.dateEnd,
        pest: idPest);

    var resp =
        await getTreatmentUseCaseImpl.updateTreatment(updatedInitialPlaga);

    final selectedTreatment = TreatmentResponseModel.fromJson(resp);
    state = state.copyWith(selectedTreatmentForEdit: selectedTreatment);

    return resp;
  }

  bool existeTratamientoConNombre(String nombre) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.tratamientos.any(
        (tratamiento) => tratamiento.name!.toLowerCase() == nombreLowerCase);
  }

  bool existeTratamientoEConNombre(
      String nombre, TreatmentResponseModel tratamientoEditar) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.tratamientos
        .where((tratamiento) =>
            tratamiento.id !=
            tratamientoEditar
                .id) // Excluir la plaga que estás editando por su ID
        .any((tratamiento) =>
            tratamiento.name!.toLowerCase() == nombreLowerCase);
  }

  void saveTreatments(
      TreatmentResponseModel? savedTreatments, int idPest) async {
    TreatmentResponseModel savedTreatment = TreatmentResponseModel(
        id: savedTreatments!.id,
        name: savedTreatments.name ?? '',
        description: savedTreatments.description ?? '',
        form: savedTreatments.form ?? '',
        state: savedTreatments.state ?? '',
        dateStart: savedTreatments.dateStart,
        dateEnd: savedTreatments.dateEnd,
        pest: idPest);

    var resp = await getTreatmentUseCaseImpl.saveTreatment(savedTreatment);

    final selectedTreatment = TreatmentResponseModel.fromJson(resp);
    state.tratamientos.add(selectedTreatment);
    state = state.copyWith(tratamientos: state.tratamientos);
  }

  void deleteTreatment(TreatmentResponseModel tratamiento) async {
    var resp = await getTreatmentUseCaseImpl.deleteTreatment(tratamiento.id);

    var temp = state.tratamientos;
    temp.remove(state.selectedTreatmentForEdit);
    state = state.copyWith(tratamientos: temp);
    print(resp);
  }

  void update(TreatmentResponseModel? tratamiento) {
    var temp = state.tratamientos;
    state.selectedTreatmentForEdit = tratamiento;
    state = state.copyWith(
        tratamientos: temp, selectedTreatmentForEdit: tratamiento);
  }

  Future<Map<String, dynamic>> updateTreatment(
      TreatmentResponseModel? updatedTratamiento,
      TreatmentResponseModel? initialTratamiento) async {
    if (updatedTratamiento == null || initialTratamiento == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }

    TreatmentResponseModel updatedInitialTratamiento = TreatmentResponseModel(
      id: updatedTratamiento.id,
      name: updatedTratamiento.name ?? initialTratamiento.name,
      description:
          updatedTratamiento.description ?? initialTratamiento.description,
      form: updatedTratamiento.form ?? initialTratamiento.form,
      state: updatedTratamiento.state ?? initialTratamiento.state,
      dateStart: updatedTratamiento.dateStart ?? initialTratamiento.dateStart,
      dateEnd: updatedTratamiento.dateEnd ?? initialTratamiento.dateEnd,
    );

    var resp = await getTreatmentUseCaseImpl
        .updateTreatment(updatedInitialTratamiento);

    final selectedTreatment = TreatmentResponseModel.fromJsonEdit(resp);
    state = state.copyWith(selectedTreatmentForEdit: selectedTreatment);

    return resp;
  }

  void edit(TreatmentResponseModel? tratamiento) {
    var temp = state.tratamientos;
    temp.remove(state.selectedTreatmentForEdit);
    temp.add(tratamiento!);
    state = state.copyWith(tratamientos: temp);
  }
}

final treatmentController = StateNotifierProvider<TreatmentController,
        TreatmentState>(
    (ref) => TreatmentController(
        GetTreatmentUseCaseImpl(TreatmentRepositoryImpl(TreatmentService()))));
