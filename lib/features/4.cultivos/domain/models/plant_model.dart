// coverage:ignore-file
class PlantResponseModel {
  final int? id;
  final String? name;
  final String? description;

  PlantResponseModel({this.id, this.name, this.description});

  Map<String, dynamic> toJson() => {
        "nombre": name,
        "descripcion": description,
      };

  factory PlantResponseModel.fromJson(Map<String, dynamic> json) => PlantResponseModel(
        id: json["id"],
        name: json["nombre"],
        description: json["descripcion"],
      );
}
