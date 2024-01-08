import 'package:agrotech/features/5.products/domain/models/product_response_model.dart';

import '../../../../common_utilities/clientHttp.dart';
import '../../../../common_utilities/httpDeleteModel.dart';
import '../../../../common_utilities/httpResponseModel.dart';
import '../../../../common_utilities/route_service.dart';

class ProductService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveProduct(
      {required ProductResponseModel productModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/productos',
        body: productModel.toJson());
  }

  Future<HttpResponseModel> getProducts({required int idCrop}) async {
    final response = await clienthttp.get(
        url: '${RouteService.routeService}/api/products/$idCrop');

    return response;
  }

  Future<HttpResponseModel> saveProductData(
      Map<String, dynamic> productData) async {
    final response = await clienthttp.post(
        url: '${RouteService.routeService}/api/productos', body: productData);
    return response;
  }

  Future<HttpResponseModel> updateProductData(
      Map<String, dynamic> productData) async {
    final response = await clienthttp.put(
      url: '${RouteService.routeService}/api/productos', // Ruta sin el cropId
      body: productData,
    );
    return response;
  }

  Future<HttpDeleteModel> deleteProductData(int? idProduct) async {
    final response = await clienthttp.delete(
        url: '${RouteService.routeService}/api/productos/$idProduct');
    return response;
  }
}
