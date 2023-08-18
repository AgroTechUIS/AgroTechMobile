import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/company_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';

class CropsDataSource {
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> loadCrops({required CompanyModel companyModel}) async {
    return clienthttp.post(url: '${RouteService.routeService}/cultivos-empresa', body: companyModel.toJson());
  }

  Future<HttpResponseModel> loadActivitiesCrop({required CropModel cropModel}) async {
    return clienthttp.post(url: '${RouteService.routeService}/actividad-cultivo', body: cropModel.toJson());
  }
}
