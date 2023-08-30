import '../../../../common_utilities/config/colors_theme.dart';
import '../../domain/models/cuidado_model.dart';
import 'my_buttom.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/material.dart';

class NewCare extends StatefulWidget {
  void Function(CareModel)? onSave;
  VoidCallback? onCancel;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController insumoController = TextEditingController();

  NewCare({super.key, this.onSave, this.onCancel});
  @override
  _NewCareState createState() => _NewCareState();
}

class _NewCareState extends State<NewCare> {
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

  DateTime? date1 = DateTime.now();
  DateTime? date2 = DateTime.now();

  late Future<DateTime?> fecha1;
  late Future<DateTime?> fecha2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Crea un nuevo cuidado"),
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
                      itemHeight: 40),
                ),
              ),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () async {
                fecha1 = showDatePicker(
                  context: context,
                  initialDate: date1 as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate1 = await fecha1;
                if (selectedDate1 != null) {
                  setState(() {
                    date1 = selectedDate1;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando inicia el cuidado:',
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
                          '${date1!.day} / ${date1!.month} / ${date1!.year}',
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
                    date1 = selectedDate2;
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
            TextField(
              controller: widget.insumoController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Insumo"),
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      CareModel nuevoCuidado = CareModel(
                        id: 0, // Asigna el ID adecuado
                        name: widget.nombreController.text,
                        description: widget.descripcionController.text,
                        type: selectedValue,
                        initialDate: DateUtils.dateOnly(date1 as DateTime),
                        finalDate: DateUtils.dateOnly(date2 as DateTime),
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
