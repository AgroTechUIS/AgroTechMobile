import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/office_repository_impl.dart';
import '../data/office_service.dart';
import '../domain/models/office_model.dart';
import '../domain/use_cases/get_office_use_case_impl.dart';
import 'office_state.dart';

class OfficeController extends StateNotifier<OfficeState> {
  OfficeController(this.getOfficeUseCaseImpl) : super(OfficeState()) {}

  // Use cases
  final GetOfficeUseCaseImpl getOfficeUseCaseImpl;

  void updateOffice(OfficeModel? despacho) {
    var temp = state.despachos;
    state.selectedOfficeForEdit = despacho;
    state = state.copyWith(despachos: temp, selectedOfficeForEdit: despacho);
  }

  Future<Map<String, dynamic>> updatesOffices(
      OfficeModel? updatedDespachos, OfficeModel? initialDespacho) async {
    if (updatedDespachos == null || initialDespacho == null) {
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    OfficeModel updatedInitialDespacho = OfficeModel(
        id: updatedDespachos.id ?? initialDespacho.id,
        name_delivery:
            updatedDespachos.name_delivery ?? initialDespacho.name_delivery,
        telephone_delivery: updatedDespachos.telephone_delivery ??
            updatedDespachos.telephone_delivery);

    var resp = await getOfficeUseCaseImpl.updateOffice(updatedInitialDespacho);

    return resp;
  }

  Future<List<OfficeModel>?> getListOffice(int idEmpresa) async {
    var resp = await getOfficeUseCaseImpl.getListOffice(idEmpresa: idEmpresa);
    state = state.copyWith(despachos: resp);
    return resp;
  }
}

final officeController = StateNotifierProvider<OfficeController, OfficeState>(
    (ref) => OfficeController(
        GetOfficeUseCaseImpl(OfficeRepositoryImpl(OfficeService()))));
