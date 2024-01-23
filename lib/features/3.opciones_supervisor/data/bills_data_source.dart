// coverage:ignore-file
import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class BillsDataSource {
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> loadBillsByFactory({required String idEmpresa, required bool isOnline}) async {
    var pref = await SecureSharedPref.getInstance();
    HttpResponseModel resp;
    if (isOnline) {
      resp = await clienthttp.get(
        url: '${RouteService.routeService}/api/facturas/empresa/$idEmpresa',
      );
      if (resp.success) pref.putMap('loadBillsByFactory', resp.body ?? {});
    } else {
      var mapStorage = await pref.getMap('loadBillsByFactory') as Map<String, dynamic>;
      if (mapStorage['error'] != null) {
        mapStorage = {'facturas': []};
      }
      resp = HttpResponseModel(success: true, body: mapStorage);
    }

    return resp;
  }

  Future<HttpResponseModel> loadBillsByCrop({required String idCultivo, required bool isOnline}) async {
    var pref = await SecureSharedPref.getInstance();
    HttpResponseModel resp;
    if (isOnline) {
      resp = await clienthttp.get(
        url: '${RouteService.routeService}api/facturas/cultivo/$idCultivo',
      );
      if (resp.success) pref.putMap('loadBillsByCrop', resp.body ?? {});
    } else {
      var mapStorage = await pref.getMap('loadBillsByCrop') as Map<String, dynamic>;
      resp = HttpResponseModel(success: true, body: mapStorage);
    }

    return resp;
  }
}
