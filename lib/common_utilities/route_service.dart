import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class RouteService {
  static const String protocol = "https";
  static const String domain = "agrotech.co";
  static const String port = "8440";

  static const String routeService = "$protocol://$domain:$port";

  Future<String> getToken(String token) async {
    var pref = await SecureSharedPref.getInstance();
    return await pref.getString(token) ?? "";
  }

  Future<Map<String, String>> getHeader() async {
    return {
      "Authorization": await getToken('tokenAnalizamos'),
    };
  }
}
