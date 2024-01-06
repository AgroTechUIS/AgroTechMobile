// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:agrotech/common_utilities/httpResponseModel.dart';
import 'package:agrotech/common_utilities/responses_mock.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ClientHttp {
  Client http = Client();
  String timeoutMessage = 'Latencia';
  String errorInternet = 'Sin internet';
  String serviceError = 'serviceError';

  Future<HttpResponseModel> get({required String url}) async {
    try {
      var response = await http.get(Uri.parse(url), headers: {}).timeout(
        const Duration(seconds: 5),
        onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")),
      );

      return response.validateResponse();
    } on TimeoutException catch (e) {
      return HttpResponseModel(success: false, body: {"error": "$e"}, message: timeoutMessage);
    } on SocketException catch (e) {
      return HttpResponseModel(success: false, body: {"error": "$e"}, message: errorInternet);
    } catch (e) {
      return HttpResponseModel(success: false, body: {"error": "$e"}, message: serviceError);
    }
  }

  Future<HttpResponseModel> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      var response = await http
          .post(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(body),
          )
          .timeout(
            const Duration(seconds: 3),
            onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")),
          );

      return response.validateResponse();
    } on TimeoutException catch (e) {
      return HttpResponseModel(success: false, body: {"error": "$e"}, message: timeoutMessage);
    } on SocketException catch (e) {
      return HttpResponseModel(success: false, body: {"error": "$e"}, message: errorInternet);
    } catch (e) {
      return HttpResponseModel(success: false, body: {"error": "$e"}, message: serviceError);
    }
  }

  Future<HttpResponseModel> put({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      var response = await http
          .put(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(body),
          )
          .timeout(
            const Duration(seconds: 3),
            onTimeout: (() => throw TimeoutException("{'error': 'Timeout'}")),
          );

      return response.validateResponse();
    } on TimeoutException catch (e) {
      return HttpResponseModel(success: false, body: {"error": "$e"}, message: timeoutMessage);
    } on SocketException catch (e) {
      return HttpResponseModel(success: false, body: {"error": "$e"}, message: errorInternet);
    } catch (e) {
      return HttpResponseModel(success: false, body: {"error": "$e"}, message: serviceError);
    }
  }
}

extension HttpUtils on Response {
  HttpResponseModel validateResponse() {
    bool success = false;
    String message = "Unknown message";
    Map<String, dynamic> body = {};

    debugPrint('$statusCode');

    switch (statusCode) {
      case 200:
      case 201:
      case 202:
        success = true;
        message = "Continue";
        body = json.decode(utf8.decode(bodyBytes));
        break;
    }
    return HttpResponseModel(success: success, message: "$message $statusCode", body: body);
  }
}

///
/// Client Fake
///

/*class ClientHttp {
  Client http = Client();
  String timeoutMessage = 'Latencia';
  String errorInternet = 'Sin internet';
  String serviceError = 'serviceError';

  Future<HttpResponseModel> get({required String url}) async {
    await Future.delayed(const Duration(seconds: 1));
    return HttpResponseModel(success: true, body: mapResponses[url.replaceAll('http://192.168.1.52:3000/', '')]);
  }

  Future<HttpResponseModel> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    var res = {
      "idUsuario": 1,
      "nombre": "Sergio Sanchez",
      "cedula": "1098816863",
      "telefono": "(318) 554-1765",
      "email": "sergio@gmail.com",
      "roles": {"rol": "supervisor"},
      "token":
          "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqb3JnZXNhbmRvdmFsNTI5QGdtYWlsLmNvbSIsImlhdCI6MTY5Njc5NzMxMiwiZXhwIjoxNjk2ODMzMzEyLCJyb2xlcyI6W3siYXV0aG9yaXR5IjoiZ2VzdGlvbl9hZ3JpY29sYSJ9XX0.4ZlrTWJzMrhsYq8IPdIJDAGiJJkoacEctc91_iqc0Jg",
      "ingreso": "2023-10-08T20:35:12.790641643",
      "idEmpresa": 11,
      "empresa": "agro ya"
    };

    return HttpResponseModel(success: true, body: res);
  }

  Future<HttpResponseModel> put({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    return HttpResponseModel(success: true);
  }
}*/
