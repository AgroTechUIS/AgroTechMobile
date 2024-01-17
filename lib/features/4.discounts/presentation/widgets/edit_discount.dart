import 'dart:ui';

import 'package:agrotech/features/4.discounts/domain/models/discount_model.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import 'my_buttom.dart';

class EditDiscount extends StatefulWidget {
  void Function(DiscountModel)? onSave;
  VoidCallback? onCancel;
  DiscountModel? initialDiscount;
  final TextEditingController valorController = TextEditingController();

  EditDiscount({
    super.key,
    this.onSave,
    this.onCancel,
    required this.initialDiscount,
  }) {
    valorController.text = initialDiscount!.discount.toString();
  }

  @override
  _editDiscountState createState() => _editDiscountState();
}

class _editDiscountState extends State<EditDiscount> {
  DateTime? date = DateTime.now();
  DateTime? date2 = DateTime.now();

  late Future<DateTime?> fecha;
  late Future<DateTime?> fecha2;

  String? selectedValue1;
  String? selectedValue2;

  final List<String> items = ['Activo', 'Desactivado'];
  final List<String> itemsState = ['Moneda', 'Porcentaje'];
  @override
  void initState() {
    super.initState();

    // plantingDate = widget.initialCrop!.plantingDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita el cultivo"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            TextField(
              controller: widget.valorController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Valor del descuento "),
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
                  child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Tipo de descuento',
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
                      value: selectedValue1,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue1 = value;
                        });
                      },
                      buttonHeight: 20,
                      buttonPadding: EdgeInsets.symmetric(horizontal: 16),
                      buttonWidth: 140,
                      itemHeight: 40),
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
                        'Estado',
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
                      value: selectedValue2,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue2 = value;
                        });
                      },
                      buttonHeight: 20,
                      buttonPadding: EdgeInsets.symmetric(horizontal: 16),
                      buttonWidth: 140,
                      itemHeight: 40),
                ),
              ),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () async {
                fecha = showDatePicker(
                  context: context,
                  initialDate: date as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate = await fecha;
                if (selectedDate != null) {
                  setState(() {
                    date = selectedDate;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando se inicia el descuento:',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors
                            .grey, // Puedes personalizar el color del borde aquí
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: InputBorder
                            .none, // Elimina el borde de InputDecorator
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${date!.day} / ${date!.month} / ${date!.year}',
                          style: TextStyle(
                            color: colors
                                .black, // Puedes personalizar el color del texto aquí
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () async {
                fecha2 = showDatePicker(
                  context: context,
                  initialDate: date2 as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate2 = await fecha2;
                if (selectedDate2 != null) {
                  setState(() {
                    date = selectedDate2;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando se acaba el descuento:',
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors
                            .grey, // Puedes personalizar el color del borde aquí
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: InputBorder
                            .none, // Elimina el borde de InputDecorator
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${date2!.day} / ${date2!.month} / ${date2!.year}',
                          style: TextStyle(
                            color: colors
                                .black, // Puedes personalizar el color del texto aquí
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                      int? valor;
                      switch (selectedValue1) {
                        case 'Porcentaje':
                          valor = 1;
                          break;
                        case 'Moneda':
                          valor = 2;
                          break;
                        default:
                          valor = null;
                      }

                      int? valor2;
                      switch (selectedValue2) {
                        case 'Activo':
                          valor2 = 1;
                          break;
                        case 'Desactivado':
                          valor2 = 2;
                          break;
                        default:
                          valor2 = 1;
                      }
                      DiscountModel nuevoDescuento = DiscountModel(
                          id: widget.initialDiscount?.id,
                          discount:
                              double.tryParse(widget.valorController.text),
                          startDateNum: date,
                          endDateNum: date2,
                          state: valor2,
                          typeDiscount: valor
                          /* ??
                              widget.initialCrop!.plantPlanted,
                          variety: widget.variedadController.text,
                          usuario: widget.initialCrop!.usuario);*/
                          );

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
