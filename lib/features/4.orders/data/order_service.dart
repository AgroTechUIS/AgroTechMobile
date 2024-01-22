import '../../../common_utilities/clientHttp.dart';
import '../../../common_utilities/httpDeleteModel.dart';
import '../../../common_utilities/httpResponseModel.dart';
import '../../../common_utilities/route_service.dart';
import '../domain/models/order_model.dart';

class OrderService {
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> getOrders({required int idEmpresa}) async {
    final response = await clienthttp.get(
        url:
            '${RouteService.routeService}/api/store/saleDetail/orders/$idEmpresa');

    return response;
  }

  Future<HttpResponseModel> updateOrderData(
      Map<String, dynamic> orderData) async {
    final response = await clienthttp.put(
      url: '${RouteService.routeService}/api/crop', // Ruta sin el cropId
      body: orderData,
    );
    return response;
  }
}
