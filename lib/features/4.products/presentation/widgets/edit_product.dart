// coverage:ignore-file
import 'dart:ui';

import 'package:agrotech/features/4.products/domain/models/product_response_model.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../../4.cultivos/domain/models/crop_response_model.dart';
import '../../../4.discounts/domain/models/discount_model.dart';
import '../product_controller.dart';
import 'my_buttom.dart';

class EditProduct extends ConsumerStatefulWidget {
  void Function(ProductResponseModel)? onSave;
  VoidCallback? onCancel;
  ProductResponseModel? initialProduct;
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController resumenController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();

  EditProduct({
    super.key,
    this.onSave,
    this.onCancel,
    required this.initialProduct,
  }) {
    nombreController.text = initialProduct?.title ?? '';
    resumenController.text = initialProduct?.resumen ?? '';
    precioController.text = initialProduct?.priceCop?.toString() ?? '';
    cantidadController.text = initialProduct?.stock.toString() ?? '';
  }

  @override
  _editProductState createState() => _editProductState();
}

class _editProductState extends ConsumerState<EditProduct> {
  @override
  String? selectedValue;
  final List<String> itemsState = ['Activo', 'Desactivado'];

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(productController);
    var controller = ref.read(productController.notifier);
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita el producto"),
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
              keyboardType: TextInputType.number,
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
                label: const Text("Precio del producto"),
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
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Estado del producto',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: itemsState
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonHeight: 20,
                    buttonPadding: EdgeInsets.symmetric(horizontal: 16),
                    buttonWidth: 140,
                    itemHeight: 40,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
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
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<DiscountModel>(
                    isExpanded: true,
                    hint: Text(
                      'Descuento',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: state.descuentos
                        .map((DiscountModel item) =>
                            DropdownMenuItem<DiscountModel>(
                              value: item,
                              child: Text(
                                '${item.discount}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: state.selectedDiscount,
                    onChanged: (DiscountModel? newValue2) {
                      if (newValue2 != null)
                        controller.updateDiscount(newValue2);
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
                      int? cantidad = int.tryParse(widget.cantidadController.text);

                      double? precio = double.tryParse(widget.precioController.text);
                      int? valor;
                      switch (selectedValue) {
                        case 'Activo':
                          valor = 1;
                          break;
                        case 'Desactivado':
                          valor = 2;
                          break;
                        default:
                          valor = null;
                      }
                      ProductResponseModel nuevoProducto = ProductResponseModel(
                          id: widget.initialProduct?.id,
                          title: widget.nombreController.text,
                          resumen: widget.resumenController.text,
                          state: valor ?? widget.initialProduct!.state,
                          priceCop: precio,
                          stock: cantidad);

                      widget.onSave!(nuevoProducto);
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
