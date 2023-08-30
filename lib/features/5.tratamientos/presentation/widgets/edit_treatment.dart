import '../../../../common_utilities/config/colors_theme.dart';
import '../../domain/models/treatment_model.dart';
import 'my_buttom.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:image_picker/image_picker.dart';

class EditTreatment extends StatefulWidget {
  void Function(TreatmentModel)? onSave;
  VoidCallback? onCancel;
  TreatmentModel? initialTratamiento;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController instruccionesController = TextEditingController();

  String? selectedValue;

  EditTreatment(
      {super.key,
      this.onSave,
      this.onCancel,
      required this.initialTratamiento}) {
    nombreController.text = initialTratamiento?.name ?? '';
    descripcionController.text = initialTratamiento?.description ?? '';
    instruccionesController.text = initialTratamiento?.instructions ?? '';
  }
  @override
  _editTreatmentState createState() => _editTreatmentState();
}

class _editTreatmentState extends State<EditTreatment> {
  final List<String> itemsTreatment = [
    'En progreso',
    'Fallo',
    'Exito',
  ];

  late Future<DateTime?> fecha;
  late Future<DateTime?> fecha2;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita el tratamiento"),
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
            Container(
              width: double.infinity,
              child: InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Estado del tratamiento',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: itemsTreatment
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
                    /*
                    buttonStyleData: const ButtonStyleData(
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
            TextField(
              controller: widget.instruccionesController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Instrucciones"),
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
                fecha = showDatePicker(
                  context: context,
                  initialDate:
                      widget.initialTratamiento!.initialDate as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate = await fecha;
                if (selectedDate != null) {
                  setState(() {
                    widget.initialTratamiento!.initialDate = selectedDate;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando inició el tratamiento:',
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
                          '${widget.initialTratamiento!.initialDate!.day} / ${widget.initialTratamiento!.initialDate!.month} / ${widget.initialTratamiento!.initialDate!.year}',
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
            InkWell(
              onTap: () async {
                fecha2 = showDatePicker(
                  context: context,
                  initialDate: widget.initialTratamiento!.finalDate as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate = await fecha2;
                if (selectedDate != null) {
                  setState(() {
                    widget.initialTratamiento!.finalDate = selectedDate;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando finaliza el tratamiento:',
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
                          '${widget.initialTratamiento!.finalDate!.day} / ${widget.initialTratamiento!.finalDate!.month} / ${widget.initialTratamiento!.finalDate!.year}',
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
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      TreatmentModel nuevoTratamiento = TreatmentModel(
                          id: 0, // Asigna el ID adecuado
                          name: widget.nombreController.text,
                          description: widget.descripcionController.text,
                          state: selectedValue,
                          instructions: widget.instruccionesController.text,
                          initialDate: widget.initialTratamiento!.initialDate,
                          finalDate: widget.initialTratamiento!.finalDate);
                      widget.onSave!(nuevoTratamiento);
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
