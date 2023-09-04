import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bill_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';

class SupervisorState {
  final List<CropModel> cultivos;
  final List<ActivityCropModel> actividades;
  final List<BillModel> ingresos;

  SupervisorState({
    this.cultivos = const [],
    this.actividades = const [],
    this.ingresos = const [],
  });

  SupervisorState copyWith({
    List<CropModel>? cultivos,
    List<ActivityCropModel>? actividades,
    List<BillModel>? ingresos,
  }) {
    return SupervisorState(
      cultivos: cultivos ?? this.cultivos,
      actividades: actividades ?? this.actividades,
      ingresos: ingresos ?? this.ingresos,
    );
  }
}
