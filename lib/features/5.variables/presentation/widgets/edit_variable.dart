// coverage:ignore-file

import 'package:agrotech/features/5.variables/domain/models/variable_model.dart';
import 'package:agrotech/features/5.variables/domain/models/variable_response_model.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import '../../../../common_utilities/config/colors_theme.dart';
import 'my_buttom.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: must_be_immutable
class EditVariable extends StatefulWidget {
  void Function(VariableResponseModel)? onSave;
  VoidCallback? onCancel;
  VariableResponseModel? initialVariable;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController metodoController = TextEditingController();
  final TextEditingController instrumentoController = TextEditingController();

  String? selectedValue;

  EditVariable({super.key, this.onSave, this.onCancel, required this.initialVariable}) {
    nombreController.text = initialVariable?.name ?? '';
    descripcionController.text = initialVariable?.description ?? '';
    metodoController.text = initialVariable?.measurement_method ?? '';
    instrumentoController.text = initialVariable?.measuring_instrument ?? '';
  }

  @override
  _editVariableState createState() => _editVariableState();
}

class _editVariableState extends State<EditVariable> {
  final List<String> itemsVariable = ['Manual', 'Sensores'];
  String? selectedValue;

  late Future<DateTime?> fecha;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita la variable ambiental"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                      'Método empleado:',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: itemsVariable
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
                  initialDate: widget.initialVariable!.date_init as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate = await fecha;
                if (selectedDate != null) {
                  setState(() {
                    widget.initialVariable!.date_init = selectedDate;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando se tomó la variable:',
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
                          '${widget.initialVariable!.date_init!.day} / ${widget.initialVariable!.date_init!.month} / ${widget.initialVariable!.date_init!.year}',
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
            TextField(
              controller: widget.instrumentoController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Instrumento"),
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
                      VariableResponseModel nuevaVariable = VariableResponseModel(
                          id: widget.initialVariable!.id, // Asigna el ID adecuado
                          name: widget.nombreController.text,
                          description: widget.descripcionController.text,
                          measurement_method: selectedValue,
                          date_init: widget.initialVariable!.date_init,
                          measuring_instrument: widget.instrumentoController.text);
                      widget.onSave!(nuevaVariable);
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
