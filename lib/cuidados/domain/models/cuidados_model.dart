class Cuidados {
  int id;
  String? name;
  String? description;
  String? type;
  DateTime? initialDate;
  DateTime? finalDate;
  String? insumo;

  Cuidados(
      {required this.id,
      this.name,
      this.description,
      this.type,
      this.initialDate,
      this.finalDate,
      this.insumo});
}
