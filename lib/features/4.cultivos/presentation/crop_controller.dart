// coverage:ignore-file
import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';
import 'package:agrotech/features/4.cultivos/domain/models/plant_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/network/crop_repository_impl.dart';
import '../data/network/crop_service.dart';
import '../domain/use_cases/get_crop_use_case_impl.dart';
import 'crop_state.dart';

class CropController extends StateNotifier<CropState> {
  CropController(this.getCropUseCaseImpl) : super(CropState()) {}

  // Use cases
  final GetCropUseCaseImpl getCropUseCaseImpl;

  void deleteCrop(CropResponseModel cultivo) async {
    var resp = await getCropUseCaseImpl.deleteCrop(cultivo.id);

    var temp = state.cultivos;
    temp.remove(state.selectedCropForEdit);
    state = state.copyWith(cultivos: temp);
    print(resp);
  }

  bool existeCultivoConNombre(String nombre) {
    final nombreLowerCase = nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.cultivos.any((cultivo) => cultivo.name!.toLowerCase() == nombreLowerCase);
  }

  bool existeCultivoEConNombre(String nombre, CropResponseModel cultivoEditar) {
    final nombreLowerCase = nombre.toLowerCase(); // Convertir el nombre a minúsculas
    return state.cultivos
        .where((cultivo) => cultivo.id != cultivoEditar.id) // Excluir la plaga que estás editando por su ID
        .any((cultivo) => cultivo.name!.toLowerCase() == nombreLowerCase);
  }

  void updateCrop(CropResponseModel? cultivo) {
    var temp = state.cultivos;
    state.selectedCropForEdit = cultivo;
    state = state.copyWith(cultivos: temp, selectedCropForEdit: cultivo);
  }

  void saveCrops(CropResponseModel? savedCultivos, int idEmpresa) async {
    CropResponseModel savedCultivo = CropResponseModel(
        id: savedCultivos!.id,
        name: savedCultivos.name ?? '',
        description: savedCultivos.description ?? '',
        cantidadSemillas: savedCultivos.cantidadSemillas ?? 0,
        costoSemillas: savedCultivos.costoSemillas ?? 0,
        idEmpresa: idEmpresa,
        idPlanta: savedCultivos.idPlanta,
        planta: savedCultivos.planta
        //plantingDate: savedCultivos.plantingDate ?? DateTime.now(),
        //usuario: savedCultivos.usuario ?? null,
        );

    var resp = await getCropUseCaseImpl.saveCrop(savedCultivo);

    final selectedCrop = CropResponseModel.fromJson(resp);
    state.cultivos.add(selectedCrop);
    state = state.copyWith(cultivos: state.cultivos);
  }

  Future<Map<String, dynamic>> updatesCrops(
      CropResponseModel? updatedCultivos, CropResponseModel? initialCultivo) async {
    if (updatedCultivos == null || initialCultivo == null) {
      // Manejar el caso en el que los argumentos sean nulos o inválidos.
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    CropResponseModel updatedInitialCultivo = CropResponseModel(
      id: updatedCultivos.id ?? initialCultivo.id,
      name: updatedCultivos.name ?? initialCultivo.name,
      description: updatedCultivos.description ?? initialCultivo.description,
      cantidadSemillas: updatedCultivos.cantidadSemillas ?? initialCultivo.cantidadSemillas,
      costoSemillas: updatedCultivos.costoSemillas ?? initialCultivo.costoSemillas,
      //plantingDate: updatedCultivos.plantingDate ?? initialCultivo.plantingDate,
      //usuario: updatedCultivos.usuario ?? initialCultivo.usuario
    );

    var resp = await getCropUseCaseImpl.updateCrop(updatedInitialCultivo);

    final selectedCrop = CropResponseModel.fromJson(resp);
    state = state.copyWith(selectedCropForEdit: selectedCrop);

    return resp;
  }

  void updatePlants(PlantResponseModel plant) async {
    var temp = state.plants;
    state.selectedPlant = plant;
    state = state.copyWith(plants: temp, selectedPlant: plant);
  }

  Future<List<CropResponseModel>?> getListCrop(int idEmpresa) async {
    // condicion: si hay internet consulte el servicio

    var resp = await getCropUseCaseImpl.getListCrops(idEmpresa: idEmpresa);
    state = state.copyWith(cultivos: resp);
    return resp;
  }

  Future<List<PlantResponseModel>?> getListPlants() async {
    // condicion: si hay internet consulte el servicio

    var resp = await getCropUseCaseImpl.getListPlants();
    state = state.copyWith(plants: resp, clearPlant: true);
    return resp;
  }
}

final cropController = StateNotifierProvider<CropController, CropState>(
    (ref) => CropController(GetCropUseCaseImpl(CropRepositoryImpl(CropService()))));
