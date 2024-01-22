import 'package:agrotech/features/5.cuidados/data/network/cuidado_repository_impl.dart';
import 'package:agrotech/features/5.cuidados/data/network/cuidado_service.dart';
import 'package:agrotech/features/5.cuidados/domain/models/cuidado_response_model.dart';
import 'package:agrotech/features/5.cuidados/domain/use_cases/get_care_use_case_impl.dart';
import 'package:agrotech/features/5.cuidados/presentation/cuidado_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CareController extends StateNotifier<CuidadoState> {
  CareController(this.getCareUseCaseImpl) : super(CuidadoState()) {
    //getListPest();
    //updatesPests(state.plagas);
  }

  // Use cases
  final GetCareUseCaseImpl getCareUseCaseImpl;

  Future<List<CareResponseModel>> getListCare(int crop) async {
    // condicion: si hay internet consulte el servicio

    var resp = await getCareUseCaseImpl.getListCare(idCrop: crop);
    state = state.copyWith(cuidados: resp);
    return resp;
  }

  Future<Map<String, dynamic>> updatesCares(
      CareResponseModel? updatedCares, CareResponseModel? initialCare) async {
    if (updatedCares == null || initialCare == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    CareResponseModel updatedInitialCare = CareResponseModel(
      id: updatedCares.id,
      name: updatedCares.name ?? initialCare.name,
      action_performed:
          updatedCares.action_performed ?? initialCare.action_performed,
      care_type: updatedCares.care_type ?? initialCare.care_type,
      date_init: updatedCares.date_init ?? initialCare.date_init,
      date_finish: updatedCares.date_finish ?? initialCare.date_finish,
      crop: updatedCares.crop ?? initialCare.crop,
      //  adjuntoDto: updatedPlagas.adjuntoDto ?? initialPlaga.adjuntoDto,
    );

    var resp = await getCareUseCaseImpl.updateCare(updatedInitialCare);

    final selectedPest = CareResponseModel.fromJson(resp);
    state = state.copyWith(selectedCuidadoForEdit: selectedPest);

    return resp;
  }

  bool existeCuidadoConNombre(String nombre) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.cuidados
        .any((cuidado) => cuidado.name!.toLowerCase() == nombreLowerCase);
  }

  bool existeCuidadoEConNombre(String nombre, CareResponseModel cuidadoEditar) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.cuidados
        .where((cuidado) =>
            cuidado.id !=
            cuidadoEditar.id) // Excluir la plaga que estás editando por su ID
        .any((cuidado) => cuidado.name!.toLowerCase() == nombreLowerCase);
  }

  void saveCares(CareResponseModel? savedCares, int crop) async {
    CareResponseModel savedCare = CareResponseModel(
      id: savedCares!.id,
      name: savedCares.name ?? '',
      action_performed: savedCares.action_performed ?? '',
      care_type: savedCares.care_type ?? '',
      date_init: savedCares.date_init ?? DateTime.now(),
      date_finish: savedCares.date_init ?? DateTime.now(),
      crop: crop,
    );

    var resp = await getCareUseCaseImpl.saveCare(savedCare);

    final selectedCare = CareResponseModel.fromJson(resp);
    state.cuidados.add(selectedCare);
    state = state.copyWith(cuidados: state.cuidados);
  }

  void deleteCare(CareResponseModel cuidado) async {
    var resp = await getCareUseCaseImpl.deleteCare(cuidado.id);

    var temp = state.cuidados;
    temp.remove(state.selectedCuidadoForEdit);
    state = state.copyWith(cuidados: temp);
    print(resp);
  }

  void saveNewCare(CareResponseModel cuidado) {
    var temp = state.cuidados;
    temp.add(cuidado);
    state = state.copyWith(cuidados: temp);
  }

  void updateCare(CareResponseModel? cuidado) {
    var temp = state.cuidados;
    state.selectedCuidadoForEdit = cuidado;
    state = state.copyWith(cuidados: temp, selectedCuidadoForEdit: cuidado);
  }

  void edit(CareResponseModel? cuidado) {
    var temp = state.cuidados;
    temp.remove(state.selectedCuidadoForEdit);
    temp.add(cuidado!);
    state = state.copyWith(cuidados: temp);
  }
}

final careController = StateNotifierProvider<CareController, CuidadoState>(
    (ref) =>
        CareController(GetCareUseCaseImpl(CareRepositoryImpl(CareService()))));
