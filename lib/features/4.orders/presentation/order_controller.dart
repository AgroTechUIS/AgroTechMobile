import 'package:agrotech/features/4.offices/domain/models/office_model.dart';
import 'package:agrotech/features/4.offices/presentation/office_state.dart';
import 'package:agrotech/features/4.orders/presentation/order_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/order_repository_impl.dart';
import '../data/order_service.dart';
import '../domain/models/order_model.dart';
import '../domain/use_cases/get_office_use_case_impl.dart';
import '../domain/use_cases/get_order_use_case_impl.dart';

class OrderController extends StateNotifier<OrderState> {
  OrderController(this.getOrderUseCaseImpl) : super(OrderState()) {}

  // Use cases
  final GetOrderUseCaseImpl getOrderUseCaseImpl;

  void updateOrder(OrderModel? pedido) {
    var temp = state.pedidos;
    state.selectedOrderForEdit = pedido;
    state = state.copyWith(pedidos: temp, selectedOrderForEdit: pedido);
  }

  Future<Map<String, dynamic>> updatesOrders(
      OrderModel? updatedPedidos, OrderModel? initialPedido) async {
    if (updatedPedidos == null || initialPedido == null) {
      throw Exception("Los argumentos no pueden ser nulos.");
    }
    OrderModel updatedInitialPedido = OrderModel(
        id: updatedPedidos.id ?? initialPedido.id,
        name_delivery:
            updatedPedidos.name_delivery ?? initialPedido.name_delivery,
        telephone_delivery: updatedPedidos.telephone_delivery ??
            updatedPedidos.telephone_delivery);

    var resp = await getOrderUseCaseImpl.updateOrder(updatedInitialPedido);

    final selectedOrder = OrderModel.fromJson(resp);
    state = state.copyWith(selectedOrderForEdit: selectedOrder);

    return resp;
  }

  Future<List<OrderModel>?> getListOrder(int idEmpresa) async {
    var resp = await getOrderUseCaseImpl.getListOrder(idEmpresa: idEmpresa);
    state = state.copyWith(pedidos: resp);
    return resp;
  }
}

final orderController = StateNotifierProvider<OrderController, OrderState>(
    (ref) => OrderController(
        GetOrderUseCaseImpl(OrderRepositoryImpl(OrderService()))));
