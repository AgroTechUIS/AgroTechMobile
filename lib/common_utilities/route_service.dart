import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class RouteService {
  static const String protocol = "http";

  /// Ambiente Web
  //static const String domain = "3.81.168.53";
  //static const String port = "8080";

  /// Ambiente Mockoon
  //static const String domain = "34.31.94.160";
  static const String port = "8080";

  static const String domain = "localhost";

  /// Ruta
  static const String routeService = "$protocol://$domain:$port";

  Future<String> getToken(String token) async {
    var pref = await SecureSharedPref.getInstance();
    return await pref.getString(token) ?? "";
  }

  Future<Map<String, String>> getHeader() async {
    return {
      "Authorization": await getToken('token'),
    };
  }
}
