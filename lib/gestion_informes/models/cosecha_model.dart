class HarvesModel {
  int? id; //
  String? tipo; //
  String? descripcion;
  double? cantidad;
  double? costo;
  double? precio;
  String? fecha;
  String? planta;
  String? zona;
  String? parcela;

  HarvesModel(
      {this.id,
      this.tipo,
      this.descripcion,
      this.cantidad,
      this.costo,
      this.precio,
      this.fecha,
      this.planta,
      this.zona,
      this.parcela});
}
