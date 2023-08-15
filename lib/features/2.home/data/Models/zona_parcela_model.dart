import 'dart:convert';

class ZonaParcela {
  int? id;
  double? metrosCuadrados;

  ZonaParcela({
    this.id,
    this.metrosCuadrados,
  });

  ZonaParcela.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    metrosCuadrados = json["metrosCuadrados"];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["metrosCuadrados"] = metrosCuadrados;
    return jsonEncode(data);
  }
}
