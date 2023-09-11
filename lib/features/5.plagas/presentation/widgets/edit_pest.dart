import 'dart:typed_data';
import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/models/pest_response_model.dart';
import 'my_buttom.dart';

// ignore: must_be_immutable
class EditPest extends StatefulWidget {
  void Function(PlagaResponseModel)? onSave;
  VoidCallback? onCancel;
  PlagaResponseModel? initialPlaga;
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController observacionesController = TextEditingController();
  final TextEditingController familiaController = TextEditingController();
  String? selectedValue;
  EditPest({
    super.key,
    this.onSave,
    this.onCancel,
    required this.initialPlaga,
  }) {
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
  late DateTime appareceDate;

  String? selectedValue;

  @override
  void initState() {
    super.initState();

    appareceDate = widget.initialPlaga!.appareceDate ?? DateTime.now();
  }

  /*pickImage(ImageSource source) async {
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
    });
  }*/

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
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      'Estado de la plaga',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: items.map<DropdownMenuItem<String>>((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      if (items.contains(value)) {
                        setState(() {
                          selectedValue = value;
                        });
                      }
                    },
                    /*
                    buttonHeight: 20,
                    buttonPadding: EdgeInsets.symmetric(horizontal: 16),
                    buttonWidth: 140,
                    itemHeight: 40,*/
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
                var selectedDate = await showDatePicker(
                  context: context,
                  initialDate: appareceDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );

                if (selectedDate != null) {
                  setState(() {
                    appareceDate = selectedDate;
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
                          '${appareceDate.day} / ${appareceDate.month} / ${appareceDate.year}',
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
                      PlagaResponseModel nuevaPlaga = PlagaResponseModel(
                        id: widget.initialPlaga?.id, // Asigna el ID adecuado
                        name: widget.nombreController.text,
                        description: widget.descripcionController.text,
                        state: selectedValue ?? '',
                        observation: widget.observacionesController.text,
                        pestFamily: widget.familiaController.text,
                        appareceDate: appareceDate,
                        adjuntoDto: widget.initialPlaga!.adjuntoDto,
                      );

                      widget.onSave!(nuevaPlaga);
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
