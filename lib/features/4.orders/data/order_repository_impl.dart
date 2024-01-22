import 'order_service.dart';

abstract class OrderRepository {
  Future<Map<String, dynamic>> getOrdersByEmpresa(int idCrop); // ??

  Future<Map<String, dynamic>> updateOrdersDataRep(
      Map<String, dynamic> orderData);
}

class OrderRepositoryImpl implements OrderRepository {
  final OrderService orderService;

  OrderRepositoryImpl(this.orderService);

  @override
  Future<Map<String, dynamic>> getOrdersByEmpresa(int idEmpresa) async {
    try {
      final orderData = await orderService.getOrders(idEmpresa: idEmpresa);
      if (orderData.success) {
        return orderData.body ?? {};
      } else {
        throw ('Error: Mal status');
      }
    } catch (e) {
      throw ('Error al obtener datos de los pedidos: $e');
    }
  }

  Future<Map<String, dynamic>> updateOrdersDataRep(
      Map<String, dynamic> orderData) async {
    try {
      final response = await orderService.updateOrderData(orderData);

      if (response.success) {
        final responseData = response.body;
        return responseData!;
      } else {
        throw ('Error: Mal status - ${response.success}');
      }
    } catch (e) {
      throw ('Error al actualizar datos del pedido: $e');
    }
  }
}
