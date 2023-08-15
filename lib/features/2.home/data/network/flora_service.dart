import 'package:agrotech/common_utilities/route_service.dart';
import 'package:http/http.dart';

class FloraService {
  final url = '${RouteService.routeService}/flora';

  Future<Response> gatFlora() async {
    /*try {
      var response = await http.post(
        Uri.parse(url),
        headers: await RouteService().getHeader(),
        body: login.toJson(),
      );
      String statusMessage = getStatusMessage(response.statusCode);
      if (response.statusCode == 200) {
        responseServiceModel = ResponseServiceModel(response: response, statusMessage: statusMessage);
      }
      debugPrint("Status - Loginservice - login  ${response.statusCode} $statusMessage");
    } catch (e) {
      debugPrint("Error - Loginservice - login  $e");
      responseServiceModel = ResponseServiceModel(statusMessage: e.toString());
    }*/

    Response resp = Response(
      '''{
      "tipoPlanta":[
      {
      "id":1,
      "nombre":"Maíz",
      "descripcion":"textolargo"
      },
      {
      "id":5,
      "nombre":"Mora",
      "descripcion":"textolargo"
      }
      ],
      "plantas":[
      {
      "id":2,
      "nombre":"Maízarrocillo",
      "descripcion":"",
      "planEmergencia":"",
      "requerimientosSuelo":"",
      "riegos":10,
      "idTipoPlanta":1,
      "mantenimientos":[
      {
      "nombre":"",
      "descripcion":"",
      "tipo":"fumigacion",
      "cantidad":3.0
      },
      {
      "nombre":"",
      "descripcion":"",
      "tipo":"Revisiondeplagas",
      "cantidad":1.0
      }
      ],
      "plagas":[
      {
      "nombre":"",
      "descripcion":"",
      "sintoma":"Hojascafes",
      "tratamiento":"fumigacioneneltallo"
      },
      {
      "nombre":"",
      "descripcion":"",
      "sintoma":"Hojasamarillas",
      "tratamiento":"fumigacioneneltallo"
      }
      ]
      },
      {
      "id":2,
      "nombre":"Maízcacahuacintle",
      "descripcion":"",
      "planEmergencia":"",
      "requerimientosSuelo":"",
      "riegos":10,
      "idTipoPlanta":1,
      "mantenimientos":[
      {
      "nombre":"",
      "descripcion":"",
      "tipo":"fumigacion",
      "cantidad":3.0
      },
      {
      "nombre":"",
      "descripcion":"",
      "tipo":"Revisiondeplagas",
      "cantidad":1.0
      }
      ],
      "plagas":[
      {
      "nombre":"",
      "descripcion":"",
      "sintoma":"Hojascafes",
      "tratamiento":"fumigacioneneltallo"
      },
      {
      "nombre":"",
      "descripcion":"",
      "sintoma":"Hojasamarillas",
      "tratamiento":"fumigacioneneltallo"
      }
      ]
      }
      ]
      }''',
      200,
      headers: {'Content-Type': 'application/json'},
    );

    return resp;
  }
}
