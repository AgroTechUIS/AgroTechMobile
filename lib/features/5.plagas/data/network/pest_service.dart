import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:agrotech/common_utilities/clientHttp.dart';

import 'package:agrotech/common_utilities/httpResponseModel.dart';

import 'package:agrotech/common_utilities/route_service.dart';

import '../../domain/models/pest_response_model.dart';

class PestService {
  final ClientHttp clienthttp = ClientHttp();

  final String baseUrl;

  PestService(this.baseUrl);

  Future<Map<String, dynamic>> getPestData(int cropId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/pest/$cropId'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al cargar los datos de las plagas!');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  /*
  Future<HttpResponseModel> savePest(
      {required PlagaResponseModel plagaModel}) async {
    return clienthttp.post(
        url: '${RouteService.routeService}/plagas', body: plagaModel.toJson());
  }

  Future<HttpResponseModel> getPestByCrop({required int idCrop}) async {
    return clienthttp.get(url: '${RouteService.routeService}/plagas/$idCrop');
  }
*/
}
