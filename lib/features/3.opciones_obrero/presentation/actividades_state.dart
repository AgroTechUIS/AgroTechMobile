import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';

class ActividadesState {
  final List<ActivityModel> actividades;
  final List<ActivityModel> actividadesFiltered;
  final DateTime? dateStart;
  final DateTime? dateLast;

  ActividadesState({
    this.actividades = const [],
    this.actividadesFiltered = const [],
    this.dateStart,
    this.dateLast,
  });

  ActividadesState copyWith({
    List<ActivityModel>? actividades,
    List<ActivityModel>? actividadesFiltered,
    DateTime? dateStart,
    DateTime? dateLast,
  }) {
    return ActividadesState(
      actividades: actividades ?? this.actividades,
      actividadesFiltered: actividadesFiltered ?? this.actividadesFiltered,
      dateStart: dateStart ?? this.dateStart,
      dateLast: dateLast ?? this.dateLast,
    );
  }
}
