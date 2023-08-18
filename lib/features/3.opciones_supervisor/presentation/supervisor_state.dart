import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/models/crop_model.dart';

class SupervisorState {
  final List<CropModel> cultivos;

  SupervisorState({
    this.cultivos = const [],
  });

  SupervisorState copyWith({
    List<CropModel>? cultivos,
  }) {
    return SupervisorState(
      cultivos: cultivos ?? this.cultivos,
    );
  }
}
