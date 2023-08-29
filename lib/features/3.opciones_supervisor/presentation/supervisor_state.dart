import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';

class SupervisorState {
  final List<CropModel> cultivos;
  final List<ActivityCropModel> actividades;

  SupervisorState({
    this.cultivos = const [],
    this.actividades = const [],
  });

  SupervisorState copyWith({
    List<CropModel>? cultivos,
    List<ActivityCropModel>? actividades,
  }) {
    return SupervisorState(
      cultivos: cultivos ?? this.cultivos,
      actividades: actividades ?? this.actividades,
    );
  }
}
