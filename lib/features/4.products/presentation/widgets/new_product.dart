// coverage:ignore-file
// ignore: must_be_immutable
import 'dart:math';

import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';
import 'package:agrotech/features/4.discounts/domain/models/discount_model.dart';
import 'package:agrotech/features/4.products/domain/models/categorie_model.dart';
import 'package:agrotech/features/4.products/domain/models/product_response_model.dart';
import 'package:agrotech/features/4.products/presentation/product_controller.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../../5.cuidados/presentation/widgets/my_buttom.dart';

class NewProduct extends ConsumerStatefulWidget {
  void Function(ProductResponseModel)? onSave;
  VoidCallback? onCancel;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController resumenController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController cropController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();

  NewProduct({super.key, this.onSave, this.onCancel});
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends ConsumerState<NewProduct> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(productController);
    var controller = ref.read(productController.notifier);
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
              controller: widget.descriptionController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Descripción "),
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
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<CategoryModel>(
                    isExpanded: true,
                    hint: Text(
                      'Categoría',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: state.categorias
                        .map((CategoryModel item) =>
                            DropdownMenuItem<CategoryModel>(
                              value: item,
                              child: Text(
                                '${item.title}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: state.selectedCategorie,
                    onChanged: (CategoryModel? newValue) {
                      if (newValue != null) controller.updateCategory(newValue);
                    },
                    buttonHeight: 20,
                    buttonPadding: EdgeInsets.symmetric(horizontal: 16),
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<CropResponseModel>(
                    isExpanded: true,
                    hint: Text(
                      'Cultivo',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: state.cultivos
                        .map((CropResponseModel item) =>
                            DropdownMenuItem<CropResponseModel>(
                              value: item,
                              child: Text(
                                '${item.name}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: state.selectedCrop,
                    onChanged: (CropResponseModel? newValue) {
                      if (newValue != null) controller.updateCrop(newValue);
                    },
                    buttonHeight: 20,
                    buttonPadding: EdgeInsets.symmetric(horizontal: 16),
                    buttonWidth: 140,
                    itemHeight: 40,
                    /*buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 20,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),*/
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
                      String cantidadText = widget.cantidadController.text;

                      if (cantidadText.isNotEmpty) {
                        cantidad = int.tryParse(cantidadText);
                      }
                      double? precio;
                      String precioText = widget.precioController.text;

                      if (precioText.isNotEmpty) {
                        precio = double.tryParse(precioText);
                      }

                      /* int? valor;
                      switch (selectedValue) {
                        case 'Activo':
                          valor = 1;
                          break;
                        case 'Desactivado':
                          valor = 2;
                          break;
                        default:
                          valor = null;
                      }*/
                      ProductResponseModel nuevoProducto = ProductResponseModel(
                          title: widget.nombreController.text,
                          resumen: widget.resumenController.text,
                          description: widget.descriptionController.text,
                          priceCop: precio,
                          stock: cantidad,
                          sku: createId(),
                          image:
                              "https://deviceimages.s3.amazonaws.com/folder1/e56bd98e-7bb8-41a9-bf87-9dc45696c5b6.jpg",
                          categorie: state.selectedCategorie!.id,
                          crop: state.selectedCrop!.id);
                      widget.onSave!(nuevoProducto);
                    },
                    color: colors.green2,
                    textColor: colors.white),
                MyButton(text: "Cerrar", onPressed: widget.onCancel, color: colors.white, textColor: colors.textColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}

String createId() {
  String id = "";
  const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  final random = Random();

  for (int i = 0; i < 5; i++) {
    id += chars[random.nextInt(chars.length)];
  }

  return id;
}
