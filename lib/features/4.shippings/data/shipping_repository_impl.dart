import 'package:agrotech/features/4.shippings/data/shipping_service.dart';

abstract class ShippingRepository {
  Future<Map<String, dynamic>?> getShippingByEmpresa(int idEmpresa);
  Future<Map<String, dynamic>> updateShippingDataRep(
      Map<String, dynamic> shippingData);
  Future<Map<String, dynamic>> saveShippingDataRep(
      Map<String, dynamic> shippingData);
  Future<String> deleteShippingsById(int? idEnvio);
}

class ShippingRepositoryImpl implements ShippingRepository {
  final ShippingService shippingService;

  ShippingRepositoryImpl(this.shippingService);

  @override
  Future<Map<String, dynamic>?> getShippingByEmpresa(int idEmpresa) async {
    try {
      final treatmentData = await shippingService.getShippings(idEmpresa);
      if (treatmentData.success) {
        return treatmentData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los tratamientos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateShippingDataRep(
      Map<String, dynamic> shippingData) async {
    try {
      final response = await shippingService.updateShippingData(shippingData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos del envio: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> saveShippingDataRep(
      Map<String, dynamic> shippingData) async {
    try {
      final response = await shippingService.saveShipping(shippingData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al guardar datos del envio: $e');
    }
  }

  @override
  Future<String> deleteShippingsById(int? idEnvio) async {
    try {
      final shippingData = await shippingService.deleteShippingData(idEnvio);
      if (shippingData.success) {
        return shippingData.message ?? 'Envio borrado';
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al borrar datos del envio: $e');
    }
  }
}
