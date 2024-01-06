import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';

class ActividadesState {
  final List<ActivityModel> actividades;
  final List<ActivityModel> actividadesFiltered;

  ActividadesState({
    this.actividades = const [],
    this.actividadesFiltered = const [],
  });

  ActividadesState copyWith({
    List<ActivityModel>? actividades,
    List<ActivityModel>? actividadesFiltered,
  }) {
    return ActividadesState(
      actividades: actividades ?? this.actividades,
      actividadesFiltered: actividadesFiltered ?? this.actividadesFiltered,
    );
  }
}
