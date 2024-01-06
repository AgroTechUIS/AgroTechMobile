// ignore: must_be_immutable
import 'package:agrotech/features/5.products/domain/models/product_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../../5.cuidados/presentation/widgets/my_buttom.dart';

class NewProduct extends StatefulWidget {
  void Function(ProductResponseModel)? onSave;
  VoidCallback? onCancel;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController resumenController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController cropController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();

  NewProduct({super.key, this.onSave, this.onCancel});
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Crea un nuevo producto"),
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
              controller: widget.resumenController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Resumen "),
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
              controller: widget.cantidadController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Cantidad"),
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
              controller: widget.precioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text("Precio"),
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
              controller: widget.categoryController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Categoría"),
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
              controller: widget.cropController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("CULTIVO"),
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
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      int? cantidad;
                      String cantidadText =
                          widget.cantidadController.value.toString();

                      if (cantidadText.isNotEmpty) {
                        cantidad = int.tryParse(cantidadText);
                      }
                      double? precio;
                      String precioText =
                          widget.precioController.value.toString();

                      if (precioText.isNotEmpty) {
                        precio = double.tryParse(precioText);
                      }

                      ProductResponseModel nuevoProducto = ProductResponseModel(
                          name: widget.nombreController.text,
                          summary: widget.resumenController.text,
                          price: precio,
                          stock: cantidad);
                      widget.onSave!(nuevoProducto);
                    },
                    color: colors.green2,
                    textColor: colors.white),
                MyButton(
                    text: "Cerrar",
                    onPressed: widget.onCancel,
                    color: colors.white,
                    textColor: colors.textColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
