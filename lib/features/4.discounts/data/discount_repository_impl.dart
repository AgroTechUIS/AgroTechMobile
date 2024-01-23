import 'package:agrotech/features/4.discounts/data/discount_service.dart';

abstract class DiscountRepository {
  Future<Map<String, dynamic>> getDiscountsByEmpresa(int idEmpresa); // ??

  Future<String> deleteDiscountsById(int? idDiscount);

  Future<Map<String, dynamic>> saveDiscountDataRep(
      Map<String, dynamic> discountData);
  Future<Map<String, dynamic>> updateDiscountDataRep(
      Map<String, dynamic> discountData);
}

class DiscountRepositoryImpl implements DiscountRepository {
  final DiscountService discountService;

  DiscountRepositoryImpl(this.discountService);

  @override
  Future<Map<String, dynamic>> getDiscountsByEmpresa(int idEmpresa) async {
    try {
      final discountData =
          await discountService.getDiscounts(idEmpresa: idEmpresa);
      if (discountData.success) {
        return discountData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los descuentos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateDiscountDataRep(
      Map<String, dynamic> discountData) async {
    try {
      final response = await discountService.updateDiscountData(discountData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos del descuento: $e');
    }
  }

  @override
  Future<String> deleteDiscountsById(int? idDiscount) async {
    try {
      final discountData = await discountService.deleteDiscountData(idDiscount);
      if (discountData.success) {
        return discountData.message ?? 'Descuento borrado';
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al borrar datos del descuento: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> saveDiscountDataRep(
      Map<String, dynamic> discountData) async {
    try {
      final response = await discountService.saveDiscountData(discountData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al guardar datos del descuento: $e');
    }
  }
}
