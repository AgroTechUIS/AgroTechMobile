import '../../data/shipping_repository_impl.dart';
import '../models/shippings_model.dart';

abstract class GetShippingUseCase {
  Future<List<ShippingsResponseModel>> getListShipping(
      {required int idEmpresa});
  Future<Map<String, dynamic>> updateShippings(
      ShippingsResponseModel? updatedEnvios);
}

class GetShippingUseCaseImpl extends GetShippingUseCase {
  final ShippingRepositoryImpl shippingRepository;

  GetShippingUseCaseImpl(
    this.shippingRepository,
  );

  @override
  Future<List<ShippingsResponseModel>> getListShipping(
      {required int idEmpresa}) async {
    try {
      var shippingData =
          await shippingRepository.getShippingByEmpresa(idEmpresa);
      List<ShippingsResponseModel>? listEnvios = [];

      for (var entry in shippingData!['address_Shipping']) {
        listEnvios.add(ShippingsResponseModel.fromJson(entry));
      }
      return listEnvios;
    } catch (e) {
      throw ('Error al obtener la lista de envios: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateShippings(
      ShippingsResponseModel? updatedEnvios) async {
    try {
      final shippingData = updatedEnvios!.toJson();
      var r = await shippingRepository.updateShippingDataRep(shippingData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de envios: $e');
    }
  }

  Future<Map<String, dynamic>> saveShipping(
      ShippingsResponseModel? savedEnvios) async {
    try {
      final shippingData = savedEnvios!.toJson();
      var s = await shippingRepository.saveShippingDataRep(shippingData);
      return s;
    } catch (e) {
      throw ('Error al guardar el envio: $e');
    }
  }

  Future<String> deleteShipping(int? idEmpresa) async {
    try {
      var d = await shippingRepository.deleteShippingsById(idEmpresa);
      return d;
    } catch (e) {
      throw ('Error al borrar el envio: $e');
    }
  }
}
