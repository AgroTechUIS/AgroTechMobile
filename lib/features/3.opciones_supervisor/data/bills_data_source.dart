import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/company_model.dart';

class BillsDataSource {
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> loadBillsClient({required CompanyModel companyModel}) async {
    return clienthttp.post(url: '${RouteService.routeService}/facturas-cliente-empresa', body: companyModel.toJson());
  }

  Future<HttpResponseModel> loadBillsSupplier({required CompanyModel companyModel}) async {
    return clienthttp.post(url: '${RouteService.routeService}/facturas-proveedor-empresa', body: companyModel.toJson());
  }

  Future<HttpResponseModel> loadBillsActivities({required CompanyModel companyModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/facturas-actividades-empresa', body: companyModel.toJson());
  }
}
