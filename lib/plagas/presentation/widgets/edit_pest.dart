import 'dart:typed_data';

import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:agrotech/plagas/presentation/widgets/camara.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/models/plagas_model.dart';
import 'my_buttom.dart';

class EditPest extends StatefulWidget {
  void Function(Plaga)? onSave;
  VoidCallback? onCancel;
  Plaga? initialPlaga;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController observacionesController = TextEditingController();
  final TextEditingController familiaController = TextEditingController();
  String? selectedValue;
  EditPest(
      {super.key, this.onSave, this.onCancel, required this.initialPlaga}) {
    nombreController.text = initialPlaga?.name ?? '';
    descripcionController.text = initialPlaga?.description ?? '';
    observacionesController.text = initialPlaga?.observation ?? '';
    familiaController.text = initialPlaga?.pestFamily ?? '';
  }
  @override
  _editPestState createState() => _editPestState();
}

class _editPestState extends State<EditPest> {
  final List<String> items = [
    'Baja precencia',
    'Precencia moderada',
    'Alta precencia',
    'Controlada',
  ];
  String? selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialPlaga
        ?.state; // Asigna el valor inicial de initialPlaga.state a selectedValue
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      return await file.readAsBytes();
    }
    print('No has seleccionado imagenes');
  }

  Uint8List? image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
      widget.initialPlaga!.image = image;
    });
  }

  late Future<DateTime?> fecha;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita la plaga"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () async {
                  return selectImage();
                },
                child: widget.initialPlaga!.image != null
                    ? CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            MemoryImage(widget.initialPlaga!.image!))
                    : CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Colors.black,
                        ),
                      )),
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
                      'Estado de la plaga',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items
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
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 20,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: widget.observacionesController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Observaciones"),
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
              controller: widget.familiaController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Familia de la plaga"),
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
                  initialDate: widget.initialPlaga!.appareceDate as DateTime,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                final selectedDate = await fecha;
                if (selectedDate != null) {
                  setState(() {
                    widget.initialPlaga!.appareceDate = selectedDate;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuando aparecio la plaga:',
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
                          '${widget.initialPlaga!.appareceDate!.day} / ${widget.initialPlaga!.appareceDate!.month} / ${widget.initialPlaga!.appareceDate!.year}',
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
            /*ElevatedButton(
                onPressed: () async {
                  fecha = showDatePicker(
                      fieldLabelText: 'Selecciona una fecha',
                      context: context,
                      initialDate: widget.initialPlaga!.appareceDate!,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  final selectedDate = await fecha;
                  if (selectedDate != null) {
                    setState(() {
                      widget.initialPlaga!.appareceDate = selectedDate;
                    });
                  }
                },
                child: Text(
                    'Selecciona una fecha. Fecha elegida: ${widget.initialPlaga!.appareceDate!.day} / ${widget.initialPlaga!.appareceDate!.month} / ${widget.initialPlaga!.appareceDate!.year} ')),*/
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      Plaga nuevaPlaga = Plaga(
                          id: 0, // Asigna el ID adecuado
                          name: widget.nombreController.text,
                          description: widget.descripcionController.text,
                          state: selectedValue,
                          observation: widget.observacionesController.text,
                          pestFamily: widget.familiaController.text,
                          appareceDate: widget.initialPlaga!.appareceDate,
                          image: widget.initialPlaga!.image);
                      widget.onSave!(nuevaPlaga);
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
