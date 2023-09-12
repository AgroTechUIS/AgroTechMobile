import 'package:agrotech/features/5.plagas/data/network/pest_repository_impl.dart';
import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_model.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_response_model.dart';
import 'package:agrotech/features/5.plagas/domain/use_cases/get_pest_use_case_impl.dart';
import 'package:agrotech/features/5.plagas/presentation/pest_state.dart';
import 'package:riverpod/riverpod.dart';

class PestController extends StateNotifier<PestState> {
  PestController(this.getPestUseCaseImpl) : super(PestState()) {
    getListPest(1);
    //updatesPests(state.plagas);
  }

  // Use cases
  final GetPestUseCaseImpl getPestUseCaseImpl;

  Future<List<PlagaResponseModel>> getListPest(int crop) async {
    // condicion: si hay internet consulte el servicio

    var resp = await getPestUseCaseImpl.getListPest(idCrop: 1);
    state = state.copyWith(plagas: resp);
    return resp;
  }

  Future<Map<String, dynamic>> updatesPests(PlagaResponseModel? updatedPlagas,
      PlagaResponseModel? initialPlaga) async {
    if (updatedPlagas == null || initialPlaga == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    PlagaResponseModel updatedInitialPlaga = PlagaResponseModel(
      id: updatedPlagas.id ?? initialPlaga.id,
      name: updatedPlagas.name ?? initialPlaga.name,
      description: updatedPlagas.description ?? initialPlaga.description,
      state: updatedPlagas.state ?? initialPlaga.state,
      observation: updatedPlagas.observation ?? initialPlaga.observation,
      appareceDate: updatedPlagas.appareceDate ?? initialPlaga.appareceDate,
      pestFamily: updatedPlagas.pestFamily ?? initialPlaga.pestFamily,
      stateTratment: updatedPlagas.stateTratment ?? initialPlaga.stateTratment,
      adjuntoDto: updatedPlagas.adjuntoDto ?? initialPlaga.adjuntoDto,
    );

    var resp = await getPestUseCaseImpl.updatePest(updatedInitialPlaga);

    final selectedPest = PlagaResponseModel.fromJson(resp);
    state = state.copyWith(selectedPlagaForEdit: selectedPest);

    return resp;
  }

  Future<Map<String, dynamic>> savePests(
      PlagaResponseModel? savedPlagas) async {
    PlagaResponseModel savedPlaga = PlagaResponseModel(
      id: savedPlagas!.id,
      name: savedPlagas.name ?? '',
      description: savedPlagas.description ?? '',
      state: savedPlagas.state ?? '',
      observation: savedPlagas.observation ?? '',
      appareceDate: savedPlagas.appareceDate ?? DateTime.now(),
      pestFamily: savedPlagas.pestFamily ?? '',
      stateTratment: savedPlagas.stateTratment ?? '',
      crop: savedPlagas.crop ?? null,
    );

    var resp = await getPestUseCaseImpl.savePest(savedPlaga);
    var temp = state.plagas;

    final selectedPest = PlagaResponseModel.fromJson(resp);
    temp.add(selectedPest);
    state = state.copyWith(plagas: temp);

    return resp;
  }

  void deletePest(PlagaResponseModel plaga) async {
    var resp = await getPestUseCaseImpl.deletePest(plaga.id);
    state.selectedPlagaForEdit = PlagaResponseModel(
      id: resp["id"],
      name: resp["name"],
      description: resp["description"],
      state: resp["state"],
      observation: resp["observation"],
      appareceDate: DateTime.parse(resp["appareceDate"]),
      pestFamily: resp["pestFamily"],
      stateTratment: resp["state_tratment"],
      adjuntoDto: resp["adjuntoDto"],
      crop: resp["crop"],
    );

    var temp = state.plagas;
    temp.remove(state.selectedPlagaForEdit);
    state = state.copyWith(plagas: temp);
  }

  void saveNewPest(PlagaResponseModel plaga) {
    var temp = state.plagas;
    temp.add(plaga);
    state = state.copyWith(plagas: temp);
  }

  void updatePest(PlagaResponseModel? plaga) {
    var temp = state.plagas;
    state.selectedPlagaForEdit = plaga;
    state = state.copyWith(plagas: temp, selectedPlagaForEdit: plaga);
  }

  void edit(PlagaResponseModel? plaga) {
    var temp = state.plagas;
    temp.remove(state.selectedPlagaForEdit);
    temp.add(plaga);
    state = state.copyWith(plagas: temp);
  }
}

final pestController = StateNotifierProvider<PestController, PestState>((ref) =>
    PestController(GetPestUseCaseImpl(PestRepositoryImpl(PestService()))));
