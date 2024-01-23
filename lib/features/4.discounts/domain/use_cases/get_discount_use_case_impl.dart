import 'package:agrotech/features/4.discounts/data/discount_repository_impl.dart';
import 'package:agrotech/features/4.discounts/domain/models/discount_model.dart';

abstract class GetDiscountUseCase {
  Future<List<DiscountModel>?> getListDiscounts({required int idEmpresa});
}

class GetDiscountUseCaseImpl extends GetDiscountUseCase {
  final DiscountRepository discountRepository;

  GetDiscountUseCaseImpl(
    this.discountRepository,
  );

  @override
  Future<List<DiscountModel>?> getListDiscounts(
      {required int idEmpresa}) async {
    try {
      var discountData =
          await discountRepository.getDiscountsByEmpresa(idEmpresa);
      List<DiscountModel>? listDiscounts = [];

      for (var entry in discountData['discounts']) {
        listDiscounts.add(DiscountModel.fromJson(entry));
      }
      return listDiscounts;
    } catch (e) {
      throw ('Error al obtener la lista de descuentos: $e');
    }
  }

  Future<Map<String, dynamic>> updateDiscount(
      DiscountModel? updatedDiscounts) async {
    try {
      final discountData = updatedDiscounts!.toJson();
      var r = await discountRepository.updateDiscountDataRep(discountData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de descuentos: $e');
    }
  }

  Future<String> deleteDiscount(int? idDiscount) async {
    try {
      var d = await discountRepository.deleteDiscountsById(idDiscount);
      return d;
    } catch (e) {
      throw ('Error al borrar el descuento: $e');
    }
  }

  Future<Map<String, dynamic>> saveDiscount(
      DiscountModel? savedDescuentos) async {
    try {
      final discountData = savedDescuentos!.toJsonPost();
      var s = await discountRepository.saveDiscountDataRep(discountData);
      return s;
    } catch (e) {
      throw ('Error al guardar el descuento: $e');
    }
  }
}
