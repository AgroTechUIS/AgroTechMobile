import 'package:agrotech/features/4.offices/domain/models/office_model.dart';

class OfficeState {
  final List<OfficeModel> despachos;
  OfficeModel? selectedOfficeForEdit;

  OfficeState({
    this.despachos = const [],
    this.selectedOfficeForEdit,
  });

  OfficeState copyWith({
    List<OfficeModel>? despachos,
    OfficeModel? selectedOfficeForEdit,
  }) {
    return OfficeState(
      despachos: despachos ?? this.despachos,
      selectedOfficeForEdit:
          selectedOfficeForEdit ?? this.selectedOfficeForEdit,
    );
  }
}
