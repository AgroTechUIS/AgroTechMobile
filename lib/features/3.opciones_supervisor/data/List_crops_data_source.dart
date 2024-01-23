// ignore_for_file: file_names
// coverage:ignore-file
import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/company_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/new_activity_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

class CropsDataSource {
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> loadCrops({required CompanyModel companyModel, required bool isOnline}) async {
    var pref = await SecureSharedPref.getInstance();
    HttpResponseModel resp;
    if (isOnline) {
      resp = await clienthttp.get(url: '${RouteService.routeService}/api/cultivos/empresa/${companyModel.idEmpresa}');
      if (resp.success) pref.putMap('loadCrops', resp.body ?? {'cultivos': []});
    } else {
      var mapStorage = await pref.getMap('loadCrops') as Map<String, dynamic>;
      if (mapStorage['error'] != null) {
        mapStorage = {'cultivos': []};
      }
      resp = HttpResponseModel(success: true, body: mapStorage);
    }

    return resp;
  }

  Future<HttpResponseModel> loadActivitiesCrop({required CropModel cropModel, required bool isOnline}) async {
    var pref = await SecureSharedPref.getInstance();
    HttpResponseModel resp;
    if (isOnline) {
      resp = await clienthttp.get(url: '${RouteService.routeService}/api/actividades/cultivo/${cropModel.idCultivo}');
      if (resp.success) pref.putMap('loadActivitiesCrop${cropModel.idCultivo}', resp.body ?? {'actividades': []});
    } else {
      var mapStorage = await pref.getMap('loadActivitiesCrop${cropModel.idCultivo}') as Map<String, dynamic>;
      if (mapStorage['error'] != null) {
        mapStorage = {'actividades': []};
      }
      resp = HttpResponseModel(success: true, body: mapStorage);
    }

    return resp;
  }

  Future<HttpResponseModel> loadListWorkers({required String id, required bool isOnline}) async {
    var pref = await SecureSharedPref.getInstance();
    HttpResponseModel resp;
    if (isOnline) {
      resp = await clienthttp.get(url: '${RouteService.routeService}/api/usuarios/obrero/$id');
      if (resp.success) pref.putMap('loadListWorkers', resp.body ?? {'obreros': []});
    } else {
      var mapStorage = await pref.getMap('loadListWorkers') as Map<String, dynamic>;
      if (mapStorage['error'] != null || mapStorage.isEmpty) {
        mapStorage = {'obreros': []};
      }
      resp = HttpResponseModel(success: true, body: mapStorage);
    }

    return resp;
  }

  Future<HttpResponseModel> newActivity({required NewActivityModel newActivity, required bool isOnline}) async {
    return clienthttp.post(url: '${RouteService.routeService}/api/actividades', body: newActivity.toJson());
  }
}
