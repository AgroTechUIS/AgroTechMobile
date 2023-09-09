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

  Future<Map<String, dynamic>> updatesPests(
      PlagaResponseModel? updatedPlagas) async {
    var resp = await getPestUseCaseImpl.updatePest(updatedPlagas);
    final selectedPest = PlagaResponseModel.fromJson(resp);

    state = state.copyWith(selectedPlagaForEdit: selectedPest);
    return resp;
  }

  void saveNewPest(PlagaResponseModel plaga) {
    var temp = state.plagas;
    temp.add(plaga);
    state = state.copyWith(plagas: temp);
  }

  void updatePest(PlagaResponseModel? plaga) {
    state = state.copyWith(selectedPlagaForEdit: plaga);
    state.selectedPlagaForEdit = plaga;
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
