import 'package:agrotech/features/4.discounts/domain/models/discount_model.dart';

import '../../../common_utilities/clientHttp.dart';
import '../../../common_utilities/httpDeleteModel.dart';
import '../../../common_utilities/httpResponseModel.dart';
import '../../../common_utilities/route_service.dart';

class DiscountService {
  final ClientHttp clienthttp = ClientHttp();

  Future<HttpResponseModel> getDiscounts({required int idEmpresa}) async {
    final response = await clienthttp.get(
        url: '${RouteService.routeService}/api/store/discount/$idEmpresa');

    return response;
  }

  Future<HttpResponseModel> saveDiscountData(
      Map<String, dynamic> discountData) async {
    final response = await clienthttp.post(
        url: '${RouteService.routeService}/api/store/discount',
        body: discountData);
    return response;
  }

  Future<HttpResponseModel> updateDiscountData(
      Map<String, dynamic> discountData) async {
    final response = await clienthttp.put(
      url:
          '${RouteService.routeService}/api/store/discount', // Ruta sin el cropId
      body: discountData,
    );
    return response;
  }

  Future<HttpDeleteModel> deleteDiscountData(int? idDiscount) async {
    final response = await clienthttp.delete(
        url: '${RouteService.routeService}/api/store/discount/$idDiscount');
    return response;
  }
}
