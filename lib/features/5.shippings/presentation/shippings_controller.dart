import 'package:agrotech/features/5.shippings/presentation/shippings_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/shipping_repository_impl.dart';
import '../data/shipping_service.dart';
import '../domain/models/shippings_model.dart';
import '../domain/use_cases/get_shipping_use_case_impl.dart';

class ShippingController extends StateNotifier<ShippingState> {
  ShippingController(this.getShippingUseCaseImpl) : super(ShippingState()) {}

  final GetShippingUseCaseImpl getShippingUseCaseImpl;

  Future<List<ShippingsResponseModel>> getListShipping(int empresa) async {
    var resp = await getShippingUseCaseImpl.getListShipping(idEmpresa: empresa);
    state = state.copyWith(envios: resp);
    return resp;
  }

  Future<Map<String, dynamic>> updatesShippings(
      ShippingsResponseModel? updatedEnvios,
      ShippingsResponseModel? initialEnvio,
      int idEmpresa) async {
    if (updatedEnvios == null || initialEnvio == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    ShippingsResponseModel updatedInitialEnvio = ShippingsResponseModel(
        id: updatedEnvios.id ?? initialEnvio.id,
        city: updatedEnvios.city ?? initialEnvio.city,
        days_to_delivery:
            updatedEnvios.days_to_delivery ?? initialEnvio.days_to_delivery,
        department: updatedEnvios.department ?? initialEnvio.department,
        name: updatedEnvios.name ?? initialEnvio.name,
        price: updatedEnvios.price ?? initialEnvio.price,
        empresa_id: idEmpresa);

    var resp =
        await getShippingUseCaseImpl.updateShippings(updatedInitialEnvio);

    final selectedShipping = ShippingsResponseModel.fromJson(resp);
    state = state.copyWith(selectedShippingForEdit: selectedShipping);

    return resp;
  }

  bool existeEnvioConNombre(String nombre) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.envios
        .any((envio) => envio.name!.toLowerCase() == nombreLowerCase);
  }

  bool existeEnvioEConNombre(
      String nombre, ShippingsResponseModel envioEditar) {
    final nombreLowerCase =
        nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.envios
        .where((envio) =>
            envio.id !=
            envioEditar.id) // Excluir la plaga que estás editando por su ID
        .any((envio) => envio.name!.toLowerCase() == nombreLowerCase);
  }

  void saveShippings(
      ShippingsResponseModel? savedShippings, int idEmpresa) async {
    ShippingsResponseModel savedShipping = ShippingsResponseModel(
        id: savedShippings!.id,
        city: savedShippings.city ?? '',
        days_to_delivery: savedShippings.days_to_delivery,
        name: savedShippings.name ?? '',
        department: savedShippings.department ?? '',
        price: savedShippings.price,
        empresa_id: idEmpresa);

    var resp = await getShippingUseCaseImpl.saveShipping(savedShipping);

    final selectedShipping = ShippingsResponseModel.fromJson(resp);
    state.envios.add(selectedShipping);
    state = state.copyWith(envios: state.envios);
  }

  void deleteShipping(ShippingsResponseModel envio) async {
    var resp = await getShippingUseCaseImpl.deleteShipping(envio.id);

    var temp = state.envios;
    temp.remove(state.selectedShippingForEdit);
    state = state.copyWith(envios: temp);
    print(resp);
  }

  void update(ShippingsResponseModel? envio) {
    var temp = state.envios;
    state.selectedShippingForEdit = envio;
    state = state.copyWith(envios: temp, selectedShippingForEdit: envio);
  }

  Future<Map<String, dynamic>> updateShipping(
      ShippingsResponseModel? updatedEnvio,
      ShippingsResponseModel? initialEnvio) async {
    if (updatedEnvio == null || initialEnvio == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }

    ShippingsResponseModel updatedInitialEnvio = ShippingsResponseModel(
        id: updatedEnvio.id,
        city: updatedEnvio.city ?? initialEnvio.city,
        days_to_delivery:
            updatedEnvio.days_to_delivery ?? initialEnvio.days_to_delivery,
        department: updatedEnvio.department ?? initialEnvio.department,
        name: updatedEnvio.name ?? initialEnvio.name,
        price: updatedEnvio.price ?? initialEnvio.price,
        empresa_id: updatedEnvio.empresa_id ?? initialEnvio.empresa_id);

    var resp =
        await getShippingUseCaseImpl.updateShippings(updatedInitialEnvio);

    final selectedShipping = ShippingsResponseModel.fromJson(resp);
    state = state.copyWith(selectedShippingForEdit: selectedShipping);

    return resp;
  }

  void edit(ShippingsResponseModel? envio) {
    var temp = state.envios;
    temp.remove(state.selectedShippingForEdit);
    temp.add(envio!);
    state = state.copyWith(envios: temp);
  }
}

final shippingController =
    StateNotifierProvider<ShippingController, ShippingState>((ref) =>
        ShippingController(
            GetShippingUseCaseImpl(ShippingRepositoryImpl(ShippingService()))));
