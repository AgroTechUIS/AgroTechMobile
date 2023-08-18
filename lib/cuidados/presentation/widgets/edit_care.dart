import 'dart:ui';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:agrotech/cuidados/domain/models/cuidados_model.dart';
import 'package:flutter/material.dart';

import '../../../config/colors_theme.dart';
import '../../../my_buttom.dart';

class EditCare extends StatefulWidget {
  void Function(Cuidados)? onSave;
  VoidCallback? onCancel;
  Cuidados? initialCuidado;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController insumoController = TextEditingController();
  String? selectedValue;
  EditCare(
      {super.key, this.onSave, this.onCancel, required this.initialCuidado}) {
    nombreController.text = initialCuidado?.name ?? '';
    descripcionController.text = initialCuidado?.description ?? '';
    insumoController.text = initialCuidado?.insumo ?? '';
  }

  @override
  _editCareState createState() => _editCareState();
}

class _editCareState extends State<EditCare> {
  final List<String> itemsCare = [
    'Preparación del suelo',
    'Riego',
    'Control de malezas',
    'Fertilización',
    'Poda',
    'Recolecion de frutos',
    'Otros'
  ];

  String? selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialCuidado
        ?.type; // Asigna el valor inicial de initialPlaga.state a selectedValue
  }

  late Future<DateTime?> fecha1;
  late Future<DateTime?> fecha2;

  DateTime? date1;
  DateTime? date2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita el cuidado"),
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
                      'Tipo del cuidado',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: itemsCare
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
                fecha1 = showDatePicker(
                  context: context,
                  initialDate: widget.initialCuidado!.initialDate as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate1 = await fecha1;
                if (selectedDate1 != null) {
                  setState(() {
                    widget.initialCuidado!.initialDate = selectedDate1;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando empieza el cuidado:',
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
                          '${widget.initialCuidado!.initialDate!.day} / ${widget.initialCuidado!.initialDate!.month} / ${widget.initialCuidado!.initialDate!.year}',
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
                  initialDate: widget.initialCuidado!.finalDate as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate2 = await fecha2;
                if (selectedDate2 != null) {
                  setState(() {
                    widget.initialCuidado!.finalDate = selectedDate2;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando termina el cuidado:',
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
                          '${widget.initialCuidado!.finalDate!.day} / ${widget.initialCuidado!.finalDate!.month} / ${widget.initialCuidado!.finalDate!.year}',
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
              height: 8,
            ),
            TextField(
              controller: widget.insumoController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Insumo:"),
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
                      Cuidados nuevoCuidado = Cuidados(
                        id: 0, // Asigna el ID adecuado
                        name: widget.nombreController.text,
                        description: widget.descripcionController.text,
                        type: selectedValue,
                        initialDate: widget.initialCuidado!.initialDate,
                        finalDate: widget.initialCuidado!.finalDate,
                        insumo: widget.insumoController.text,
                      );
                      widget.onSave!(nuevoCuidado);
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
