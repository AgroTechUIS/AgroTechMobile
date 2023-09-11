import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:agrotech/common_utilities/clientHttp.dart';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/route_service.dart';

class PestService {
  final ClientHttp clienthttp = ClientHttp();

  PestService();

  Future<HttpResponseModel> getPestData(int cropId) async {
    final response = await clienthttp.get(
        url: '${RouteService.routeService}/api/pest/$cropId');

    return response;
  }

  Future<HttpResponseModel> updatePestData(
      Map<String, dynamic> pestData) async {
    final response = await clienthttp.put(
      url: '${RouteService.routeService}/api/pest', // Ruta sin el cropId
      body: pestData,
    );
    return response;
  }

  Future<HttpResponseModel> savePestData(Map<String, dynamic> pestData) async {
    final response = await clienthttp.post(
        url: '${RouteService.routeService}/api/pest', body: pestData);
    return response;
  }
/*
  Future<HttpResponseModel> getPestByCrop({required int idCrop}) async {
    return clienthttp.get(url: '${RouteService.routeService}/plagas/$idCrop');
  }*/
}
