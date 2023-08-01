class ActividadCultivoModel {
  final int id;
  final String nombre;
  final String fecha;
  final String planta;
  final String zona;
  final String parcela;
  final double valor;
  final bool periodica;
  final bool estado;

  ActividadCultivoModel(
    this.id,
    this.nombre,
    this.fecha,
    this.planta,
    this.zona,
    this.parcela,
    this.valor,
    this.periodica,
    this.estado,
  );
}
