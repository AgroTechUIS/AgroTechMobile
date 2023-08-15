import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';

class ActividadesState {
  final List<ActivityModel> actividades;

  ActividadesState({
    this.actividades = const [],
  });

  ActividadesState copyWith({
    List<ActivityModel>? actividades,
  }) {
    return ActividadesState(
      actividades: actividades ?? this.actividades,
    );
  }
}
