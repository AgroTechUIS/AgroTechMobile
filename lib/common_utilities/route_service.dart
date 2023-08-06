import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class RouteService {
  static const String protocol = "http";
  static const String domain = "192.168.1.52";
  static const String port = "3000";

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
