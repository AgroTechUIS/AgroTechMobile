// ignore: must_be_immutable
import 'package:agrotech/features/4.cultivos/domain/models/plant_model.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_controller.dart';
import 'package:agrotech/features/4.discounts/domain/models/discount_model.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../../5.cuidados/presentation/widgets/my_buttom.dart';

class NewDiscount extends ConsumerStatefulWidget {
  void Function(DiscountModel)? onSave;
  VoidCallback? onCancel;

  final TextEditingController valorController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController cantidadSemillasController =
      TextEditingController();
  final TextEditingController costoSemillasController = TextEditingController();

  NewDiscount({super.key, this.onSave, this.onCancel});
  @override
  _NewDiscountState createState() => _NewDiscountState();
}

class _NewDiscountState extends ConsumerState<NewDiscount> {
  DateTime? date = DateTime.now();
  DateTime? date2 = DateTime.now();

  late Future<DateTime?> fecha;
  late Future<DateTime?> fecha2;

  final List<String> itemsState = ['Moneda', 'Porcentaje'];
  String? selectedValue;

  String? valorInicial = null;
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(cropController);
    var controller = ref.read(cropController.notifier);
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Crea un nuevo descuento"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            TextField(
              controller: widget.valorController,
              keyboardType: TextInputType.number,
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
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
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
            SizedBox(height: 12),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      int? valor;
                      switch (selectedValue) {
                        case 'Porcentaje':
                          valor = 1;
                          break;
                        case 'Moneda':
                          valor = 2;
                          break;
                        default:
                          valor = null;
                      }
                      DiscountModel nuevoCultivo = DiscountModel(
                        discount: double.tryParse(widget.valorController.text),
                        typeDiscount: valor,
                        startDateNum: date,
                        endDateNum: date2,
                        state: 1,

                        //usuario: UserEmail(email: "jorgesandoval529@gmail.com"),
                      );
                      widget.onSave!(nuevoCultivo);
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
