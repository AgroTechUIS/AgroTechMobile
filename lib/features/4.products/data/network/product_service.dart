// coverage:ignore-file
import 'package:agrotech/features/4.products/domain/models/product_response_model.dart';

import '../../../../common_utilities/clientHttp.dart';
import '../../../../common_utilities/httpDeleteModel.dart';
import '../../../../common_utilities/httpResponseModel.dart';
import '../../../../common_utilities/route_service.dart';

class ProductService {
  final ClientHttp clienthttp = ClientHttp();
  Future<HttpResponseModel> saveProduct({required ProductResponseModel productModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/api/store/product/productsOwn', body: productModel.toJson());
  }

  Future<HttpResponseModel> getProducts({required int idEmpresa}) async {
    final response = await clienthttp.get(url: '${RouteService.routeService}/api/store/product/productsOwn/$idEmpresa');

    return response;
  }

  Future<HttpResponseModel> getCategories() async {
    final response = await clienthttp.get(url: '${RouteService.routeService}/api/store/categorie');

    return response;
  }

  Future<HttpResponseModel> saveProductData(Map<String, dynamic> productData, {required int idEmpresa}) async {
    final response = await clienthttp.post(
        url: '${RouteService.routeService}/api/store/product/productsOwn/$idEmpresa',
        body: productData); // api/store/products
    return response;
  }

  Future<HttpResponseModel> updateProductData(Map<String, dynamic> productData) async {
    final response = await clienthttp.put(
      url: '${RouteService.routeService}/api/store/product/productsOwn/', // Ruta sin el cropId
      body: productData,
    );
    return response;
  }

  Future<HttpDeleteModel> deleteProductData(int? idProduct) async {
    final response =
        await clienthttp.delete(url: '${RouteService.routeService}/api/store/product/productsOwn/$idProduct');
    return response;
  }
}
