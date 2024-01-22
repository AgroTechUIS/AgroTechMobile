import 'package:agrotech/features/4.offices/domain/models/office_model.dart';

import '../../data/order_repository_impl.dart';
import '../models/order_model.dart';

abstract class GetOrderUseCase {
  Future<List<OrderModel>> getListOrder({required int idEmpresa});
  Future<Map<String, dynamic>> updateOrder(OrderModel? updatedDespachos);
}

class GetOrderUseCaseImpl extends GetOrderUseCase {
  final OrderRepositoryImpl orderRepository;

  GetOrderUseCaseImpl(
    this.orderRepository,
  );

  @override
  Future<List<OrderModel>> getListOrder({required int idEmpresa}) async {
    try {
      var orderData = await orderRepository.getOrdersByEmpresa(idEmpresa);
      List<OrderModel>? listPedidos = [];

      for (var entry in orderData['orders']) {
        listPedidos.add(OrderModel.fromJson(entry));
      }
      return listPedidos;
    } catch (e) {
      throw ('Error al obtener la lista de pedidos: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateOrder(OrderModel? updatedPedidos) async {
    try {
      final orderData = updatedPedidos!.toJson();
      var r = await orderRepository.updateOrdersDataRep(orderData);
      return r;
    } catch (e) {
      throw ('Error al actualizar la lista de pedidos: $e');
    }
  }
}
