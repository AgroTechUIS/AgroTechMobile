import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_response_model.dart';
import 'package:agrotech/features/5.plagas/presentation/pest_page.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import '../../domain/models/pest_model.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'my_buttom.dart';

// ignore: must_be_immutable
class NewPest extends StatefulWidget {
  void Function(PlagaResponseModel)? onSave;
  VoidCallback? onCancel;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController observacionesController = TextEditingController();
  final TextEditingController familiaController = TextEditingController();

  NewPest({super.key, this.onSave, this.onCancel});
  @override
  _NewPestState createState() => _NewPestState();
}

class _NewPestState extends State<NewPest> {
  final List<String> items = [
    'Baja precencia',
    'Precencia moderada',
    'Alta precencia',
    'Controlada',
  ];
  String? selectedValue;

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
    });
  }

  DateTime? date = DateTime.now();
  late Future<DateTime?> fecha;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Crea una nueva plaga"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async {
                return selectImage();
              },
              child: image != null
                  ? CircleAvatar(
                      radius: 40, backgroundImage: MemoryImage(image!))
                  : CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
            ),
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
                      buttonHeight: 20,
                      buttonPadding: EdgeInsets.symmetric(horizontal: 16),
                      buttonWidth: 140,
                      itemHeight: 40
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
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      PlagaResponseModel nuevaPlaga = PlagaResponseModel(
                        id: 0, // Asigna el ID adecuado
                        name: widget.nombreController.text,
                        description: widget.descripcionController.text,
                        state: selectedValue,
                        observation: widget.observacionesController.text,
                        pestFamily: widget.familiaController.text,
                        appareceDate: DateUtils.dateOnly(date as DateTime),
                        image: image,
                      );
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
