// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:agrotech/features/6.medidas/domain/models/measure_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../domain/models/measure_model.dart';
import 'my_buttom.dart';

class NewMedida extends ConsumerWidget {
  void Function(MeasureResponseModel)? onSave;
  VoidCallback? onCancel;

  final TextEditingController valueController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController unitController = TextEditingController();

  NewMedida({super.key, this.onSave, this.onCancel});

  String? selectedValue;
  DateTime? selectedTime;
  DateTime date = DateTime.now();

  late Future<DateTime?> fecha;
  int? intValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Crea una nueva medida de tu variable"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: valueController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                label: const Text("Valor "),
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
              onChanged: (text) {
                if (text.isNotEmpty) {
                  intValue = int.tryParse(text);
                } else {
                  intValue = null;
                }
              },
            ),
            SizedBox(height: 12),
            TextField(
              controller: descripcionController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Descripcion "),
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
            InkWell(
              onTap: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(date),
                  );

                  if (selectedTime != null) {
                    date = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    );
                  }
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando se registra la medida:',
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
                          '${date.day} / ${date.month} / ${date.year} | ${date.hour}:${date.minute}',
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
            TextField(
              controller: unitController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Unidad "),
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
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      MeasureResponseModel nuevaMedida = MeasureResponseModel(
                          id: 0, // Asigna el ID adecuado
                          measurement_value: intValue,
                          description: descripcionController.text,
                          date: date,
                          measuring_unit: unitController.text);
                      onSave!(nuevaMedida);
                    },
                    color: colors.green2,
                    textColor: colors.white),
                MyButton(
                    text: "Cerrar",
                    onPressed: onCancel,
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
