import 'package:agrotech/features/5.shippings/domain/models/shippings_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../../4.cultivos/presentation/widgets/my_buttom.dart';

class EditShipping extends StatefulWidget {
  void Function(ShippingsResponseModel)? onSave;
  VoidCallback? onCancel;
  ShippingsResponseModel? initialEnvio;
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController daysController = TextEditingController();

  String? selectedValue;
  EditShipping({
    super.key,
    this.onSave,
    this.onCancel,
    required this.initialEnvio,
  }) {
    nombreController.text = initialEnvio?.name ?? '';
    departmentController.text = initialEnvio?.department ?? '';
    priceController.text = '${initialEnvio?.price}';
    daysController.text = '${initialEnvio?.days_to_delivery}';
    cityController.text = initialEnvio?.city ?? '';
  }
  @override
  _editShippingState createState() => _editShippingState();
}

class _editShippingState extends State<EditShipping> {
  late int? days;
  late double? price;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    days = widget.initialEnvio!.days_to_delivery ?? null;

    price = widget.initialEnvio!.price ?? null;
  }

  late Future<DateTime?> fecha;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita el envio"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            TextField(
              controller: widget.nombreController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Nombre "),
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
              controller: widget.cityController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Ciudad "),
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
              controller: widget.departmentController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Departamento"),
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
            TextFormField(
              controller: widget.priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text("Precio "),
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Por favor, ingresa un valor";
                }
                if (double.tryParse(value) == null) {
                  return "Ingresa un número válido";
                }
                return null; // La validación pasó
              },
              onChanged: (text) {
                setState(() {
                  price = double.tryParse(text);
                });
              },
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: widget.daysController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text("Dias de entrega"),
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Por favor, ingresa un valor";
                }
                if (int.tryParse(value) == null) {
                  return "Ingresa un número válido";
                }
                return null; // La validación pasó
              },
              onChanged: (text) {
                setState(() {
                  days = int.tryParse(text);
                });
              },
            ),
            SizedBox(height: 12),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      ShippingsResponseModel nuevoEnvio =
                          ShippingsResponseModel(
                              id: widget
                                  .initialEnvio!.id, // Asigna el ID adecuado
                              name: widget.nombreController.text,
                              city: widget.cityController.text,
                              department: widget.departmentController.text,
                              price: price,
                              days_to_delivery: days,
                              empresa_id: widget.initialEnvio!.empresa_id);

                      widget.onSave!(nuevoEnvio);
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
