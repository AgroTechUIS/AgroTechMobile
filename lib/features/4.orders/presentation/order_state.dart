import 'package:agrotech/features/4.offices/domain/models/office_model.dart';
import 'package:agrotech/features/4.orders/domain/models/order_model.dart';

class OrderState {
  final List<OrderModel> pedidos;
  OrderModel? selectedOrderForEdit;

  OrderState({
    this.pedidos = const [],
    this.selectedOrderForEdit,
  });

  OrderState copyWith({
    List<OrderModel>? pedidos,
    OrderModel? selectedOrderForEdit,
  }) {
    return OrderState(
      pedidos: pedidos ?? this.pedidos,
      selectedOrderForEdit: selectedOrderForEdit ?? this.selectedOrderForEdit,
    );
  }
}
