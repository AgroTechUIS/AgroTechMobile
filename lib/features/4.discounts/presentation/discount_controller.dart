import 'package:agrotech/features/4.discounts/data/discount_repository_impl.dart';
import 'package:agrotech/features/4.discounts/data/discount_service.dart';
import 'package:agrotech/features/4.discounts/domain/models/discount_model.dart';
import 'package:agrotech/features/4.discounts/domain/use_cases/get_discount_use_case_impl.dart';
import 'package:agrotech/features/4.discounts/presentation/discount_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../4.products/domain/use_cases/get_product_use_case_impl.dart';

class DiscountController extends StateNotifier<DiscountState> {
  DiscountController(this.getDiscountUseCaseImpl) : super(DiscountState()) {}

  // Use cases
  final GetDiscountUseCaseImpl getDiscountUseCaseImpl;

  void deleteDiscount(DiscountModel descuento) async {
    var resp = await getDiscountUseCaseImpl.deleteDiscount(descuento.id);

    var temp = state.descuentos;
    temp.remove(state.selectedDiscountForEdit);
    state = state.copyWith(descuentos: temp);
    print(resp);
  }

  bool existeDescuento(double valor) {
    // Convertir el nombre a minúsculas
    return state.descuentos.any((descuento) => descuento.discount == valor);
  }

  bool existeDescuentoE(double valor, DiscountModel descuentoEditar) {
    return state.descuentos
        .where((descuento) =>
            descuento.discount !=
            descuentoEditar
                .discount) // Excluir la plaga que estás editando por su ID
        .any((descuento) => descuento.discount == valor);
  }

  void updateDiscount(DiscountModel? descuento) {
    var temp = state.descuentos;
    state.selectedDiscountForEdit = descuento;
    state =
        state.copyWith(descuentos: temp, selectedDiscountForEdit: descuento);
  }

  void saveDiscounts(DiscountModel? savedDescuentos, int idEmpresa) async {
    DiscountModel savedDescuento = DiscountModel(
        id: savedDescuentos!.id,
        discount: savedDescuentos.discount,
        startDateNum: savedDescuentos.startDateNum,
        endDateNum: savedDescuentos.endDateNum,
        store: idEmpresa.toString(),
        state: savedDescuentos.state,
        typeDiscount: savedDescuentos.typeDiscount);

    var resp = await getDiscountUseCaseImpl.saveDiscount(savedDescuento);

    final selectedDiscount = DiscountModel.fromJson(resp);
    state.descuentos.add(selectedDiscount);
    state = state.copyWith(descuentos: state.descuentos);
  }

  Future<Map<String, dynamic>> updatesDiscounts(
      DiscountModel? updatedDescuentos, DiscountModel? initialDescuento) async {
    if (updatedDescuentos == null || initialDescuento == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    DiscountModel updatedInitialDescuento = DiscountModel(
      id: updatedDescuentos.id ?? initialDescuento.id,
      discount: updatedDescuentos.discount ?? initialDescuento.discount,
      startDateNum:
          updatedDescuentos.startDateNum ?? initialDescuento.startDateNum,
      endDateNum: updatedDescuentos.endDateNum ?? initialDescuento.endDateNum,
      state: updatedDescuentos.state ?? initialDescuento.state,
      typeDiscount:
          updatedDescuentos.typeDiscount ?? initialDescuento.typeDiscount,
      store: updatedDescuentos.store ?? initialDescuento.store,

      //plantingDate: updatedCultivos.plantingDate ?? initialCultivo.plantingDate,
      //usuario: updatedCultivos.usuario ?? initialCultivo.usuario
    );

    var resp =
        await getDiscountUseCaseImpl.updateDiscount(updatedInitialDescuento);

    final selectedDiscount = DiscountModel.fromJson(resp);
    state = state.copyWith(selectedDiscountForEdit: selectedDiscount);

    return resp;
  }

  Future<List<DiscountModel>?> getListDiscount(int idEmpresa) async {
    var resp =
        await getDiscountUseCaseImpl.getListDiscounts(idEmpresa: idEmpresa);
    state = state.copyWith(descuentos: resp);
    return resp;
  }
}

final discountController =
    StateNotifierProvider<DiscountController, DiscountState>((ref) =>
        DiscountController(
            GetDiscountUseCaseImpl(DiscountRepositoryImpl(DiscountService()))));
