class ListResponseModel<T> {
  List<T>? list;

  ListResponseModel({
    this.list,
  });

  ListResponseModel.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson, key) {
    var mapList = json[key] as List<dynamic>;

    list = mapList.map((actividadJson) {
      return fromJson(actividadJson);
    }).toList();
  }
}
