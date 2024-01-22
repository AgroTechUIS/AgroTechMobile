import 'package:agrotech/features/4.orders/presentation/widgets/edit_order.dart';
import 'package:agrotech/features/4.orders/presentation/widgets/orders_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../domain/models/order_model.dart';
import 'order_controller.dart';
import 'order_state.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class OrderPage extends ConsumerWidget {
  OrderPage({super.key, required this.idEmpresa});

  final int idEmpresa;

  void editOrder(context, OrderModel pedido, OrderController controller,
      OrderState state) {
    state.selectedOrderForEdit = pedido;
    showDialog(
      context: context,
      builder: (context) {
        return EditOrder(
          initialOrder: state.selectedOrderForEdit,
          onSave: (nc) async {
            final nca = await controller.updatesOrders(nc, pedido);

            OrderModel orderModel = OrderModel.fromJson(nca);
            if (orderModel.name_delivery == null ||
                orderModel.telephone == null) {
              Fluttertoast.showToast(
                msg: 'Llena los campos correctamente.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Color.fromARGB(255, 158, 37, 37), // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.getListOrder(idEmpresa);
              Fluttertoast.showToast(
                msg: 'Pedido despachado correctamente.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor:
                    const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
                textColor: Colors.white,
              );
            }
            Navigator.of(context).pop();
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(orderController);
    var controller = ref.read(orderController.notifier);
    return Scaffold(
      backgroundColor: colors.appbar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Pedidos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                children: state.pedidos
                    .map((e) => OrderWidget(
                          pedido: e,
                          onEdit: () {
                            editOrder(context, e, controller, state);
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
