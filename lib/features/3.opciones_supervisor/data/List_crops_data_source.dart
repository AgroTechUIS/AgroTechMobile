import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/company_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/new_activity_model.dart';

class CropsDataSource {
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> loadCrops({required CompanyModel companyModel}) async {
    return clienthttp.post(url: '${RouteService.routeService}/cultivos-empresa', body: companyModel.toJson());
  }

  Future<HttpResponseModel> loadActivitiesCrop({required CropModel cropModel}) async {
    return clienthttp.post(url: '${RouteService.routeService}/actividad-cultivo', body: cropModel.toJson());
  }

  Future<HttpResponseModel> loadListWorkers({required String id}) async {
    return clienthttp.get(url: '${RouteService.routeService}/api/obreros/11');
  }

  Future<HttpResponseModel> newActivity({required NewActivityModel newActivity}) async {
    return clienthttp.post(url: '${RouteService.routeService}/api/actividades/nueva', body: newActivity.toJson());
  }
}
