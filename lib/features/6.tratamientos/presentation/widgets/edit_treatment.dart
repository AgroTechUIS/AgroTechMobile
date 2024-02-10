// coverage:ignore-file
import '../../../../common_utilities/config/colors_theme.dart';
import '../../domain/models/treatment_model.dart';
import '../../domain/models/treatment_response_model.dart';
import 'my_buttom.dart';
import 'package:flutter/material.dart';

import 'package:dropdown_button3/dropdown_button3.dart';

// ignore: must_be_immutable
class EditTreatment extends StatefulWidget {
  void Function(TreatmentResponseModel)? onSave;
  VoidCallback? onCancel;
  TreatmentResponseModel? initialTratamiento;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController formController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController observationController = TextEditingController();

  String? selectedValue;

  EditTreatment({super.key, this.onSave, this.onCancel, required this.initialTratamiento}) {
    nombreController.text = initialTratamiento?.name ?? '';
    descripcionController.text = initialTratamiento?.description ?? '';
    formController.text = initialTratamiento?.form ?? '';
    stateController.text = initialTratamiento?.state ?? '';
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
            TextField(
              controller: widget.formController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Form "),
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
            InkWell(
              onTap: () async {
                fecha = showDatePicker(
                  context: context,
                  initialDate: widget.initialTratamiento!.dateStart as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate = await fecha;
                if (selectedDate != null) {
                  setState(() {
                    widget.initialTratamiento!.dateStart = selectedDate;
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
                        color: Colors.grey, // Puedes personalizar el color del borde aquí
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: InputBorder.none, // Elimina el borde de InputDecorator
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${widget.initialTratamiento!.dateStart!.day} / ${widget.initialTratamiento!.dateStart!.month} / ${widget.initialTratamiento!.dateStart!.year}',
                          style: TextStyle(
                            color: colors.black, // Puedes personalizar el color del texto aquí
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
                  initialDate: widget.initialTratamiento!.dateEnd as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate = await fecha2;
                if (selectedDate != null) {
                  setState(() {
                    widget.initialTratamiento!.dateEnd = selectedDate;
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
                        color: Colors.grey, // Puedes personalizar el color del borde aquí
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: InputBorder.none, // Elimina el borde de InputDecorator
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${widget.initialTratamiento!.dateEnd!.day} / ${widget.initialTratamiento!.dateEnd!.month} / ${widget.initialTratamiento!.dateEnd!.year}',
                          style: TextStyle(
                            color: colors.black, // Puedes personalizar el color del texto aquí
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
                      TreatmentResponseModel nuevoTratamiento = TreatmentResponseModel(
                        id: widget.initialTratamiento!.id, // Asigna el ID adecuado
                        name: widget.nombreController.text,
                        description: widget.descripcionController.text,
                        form: widget.formController.text,
                        state: selectedValue ?? widget.initialTratamiento!.state,
                        dateStart: widget.initialTratamiento!.dateStart,
                        dateEnd: widget.initialTratamiento!.dateEnd,
                      );
                      widget.onSave!(nuevoTratamiento);
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
