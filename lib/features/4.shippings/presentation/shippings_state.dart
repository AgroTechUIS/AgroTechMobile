// coverage:ignore-file
import '../domain/models/shippings_model.dart';

class ShippingState {
  final List<ShippingsResponseModel> envios;
  ShippingsResponseModel? selectedShippingForEdit;

  ShippingState({
    this.envios = const [],
    this.selectedShippingForEdit,
  });

  ShippingState copyWith({
    List<ShippingsResponseModel>? envios,
    ShippingsResponseModel? selectedShippingForEdit,
  }) {
    return ShippingState(
      envios: envios ?? this.envios,
      selectedShippingForEdit: selectedShippingForEdit ?? this.selectedShippingForEdit,
    );
  }
}
