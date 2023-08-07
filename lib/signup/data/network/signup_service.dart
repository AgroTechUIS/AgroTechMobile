import 'dart:convert';

import 'package:agrotech/common_utilities/route_service.dart';
import 'package:agrotech/signup/domain/models/signup_response_model.dart';
import 'package:http/http.dart';

class SignUpService {
  final url = '${RouteService.routeService}/registro';
}
