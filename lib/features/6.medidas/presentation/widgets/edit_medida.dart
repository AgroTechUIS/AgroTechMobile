import 'package:agrotech/features/6.medidas/domain/models/measure_model.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import '../../../../common_utilities/config/colors_theme.dart';
import 'my_buttom.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditMedida extends StatefulWidget {
  void Function(MeasureModel)? onSave;
  VoidCallback? onCancel;
  MeasureModel? initialMedida;

  final TextEditingController valueController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController metodoController = TextEditingController();
  final TextEditingController unitController = TextEditingController();

  String? selectedValue;

  EditMedida(
      {super.key, this.onSave, this.onCancel, required this.initialMedida}) {
    valueController.text = '${initialMedida?.value}';
    descripcionController.text = initialMedida?.description ?? '';
    unitController.text = initialMedida?.unit ?? '';
  }

  @override
  _editMedidaState createState() => _editMedidaState();
}

class _editMedidaState extends State<EditMedida> {
  String? selectedValue;
  int? intValue;

  DateTime? selectedTime;
  DateTime date = DateTime.now();
  late Future<DateTime?> fecha;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita la medida"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: widget.valueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text("Valor de la medida"),
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
                  intValue = int.tryParse(text);
                });
              },
            ),
            SizedBox(height: 12),
            TextField(
              controller: widget.descripcionController,
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
                  initialDate: widget.initialMedida!.date as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );

                if (selectedDate != null) {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(date),
                  );

                  if (selectedTime != null) {
                    setState(() {
                      widget.initialMedida!.date = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    });
                  }
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando se tomó la medida:',
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
                      decoration: const InputDecoration(
                        border: InputBorder
                            .none, // Elimina el borde de InputDecorator
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${widget.initialMedida!.date!.day} / ${widget.initialMedida!.date!.month} / ${widget.initialMedida!.date!.year} | ${widget.initialMedida!.date!.hour}:${widget.initialMedida!.date!.minute} ',
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
            TextField(
              controller: widget.unitController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Unidad"),
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
                      MeasureModel nuevaMedida = MeasureModel(
                          id: 0, // Asigna el ID adecuado
                          value: intValue,
                          description: widget.descripcionController.text,
                          date: widget.initialMedida!.date,
                          unit: widget.unitController.text);
                      widget.onSave!(nuevaMedida);
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
