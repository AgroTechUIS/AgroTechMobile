import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../../6.medidas/presentation/widgets/my_buttom.dart';
import '../../domain/models/order_model.dart';

class EditOrder extends StatefulWidget {
  void Function(OrderModel)? onSave;
  VoidCallback? onCancel;
  OrderModel? initialOrder;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phbneController = TextEditingController();

  EditOrder({
    super.key,
    this.onSave,
    this.onCancel,
    required this.initialOrder,
  }) {}

  // ignore: empty_constructor_bodies
  @override
  _editOrderState createState() => _editOrderState();
}

class _editOrderState extends State<EditOrder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Despacha el pedido"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            TextField(
              controller: widget.nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Nombre del domiciliario "),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: widget.phbneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                label: const Text("Telefono "),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      OrderModel nuevoDescuento = OrderModel(
                          id: widget.initialOrder?.id,
                          name_delivery: widget.nameController.text,
                          telephone_delivery: widget.phbneController.text);

                      widget.onSave!(nuevoDescuento);
                    },
                    color: colors.green2,
                    textColor: colors.white),
                MyButton(
                  text: "Cerrar",
                  onPressed: widget.onCancel,
                  color: colors.white,
                  textColor: colors.textColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
