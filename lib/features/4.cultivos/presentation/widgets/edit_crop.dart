import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../domain/models/crop_response_model.dart';
import 'my_buttom.dart';

class EditCrop extends StatefulWidget {
  void Function(CropResponseModel)? onSave;
  VoidCallback? onCancel;
  CropResponseModel? initialCrop;
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController cantidadSemillasController =
      TextEditingController();
  final TextEditingController costoSemillasController = TextEditingController();

  EditCrop({
    super.key,
    this.onSave,
    this.onCancel,
    required this.initialCrop,
  }) {
    nombreController.text = initialCrop?.name ?? '';
    descripcionController.text = initialCrop?.description ?? '';
    cantidadSemillasController.text =
        initialCrop?.cantidadSemillas.toString() ?? '';
    costoSemillasController.text = initialCrop?.costoSemillas?.toString() ?? '';
  }

  @override
  _editPestState createState() => _editPestState();
}

class _editPestState extends State<EditCrop> {
  late DateTime plantingDate;
  int? plantasSembradas;

  @override
  void initState() {
    super.initState();

    // plantingDate = widget.initialCrop!.plantingDate ?? DateTime.now();
  }

  late Future<DateTime?> fecha;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Edita el cultivo"),
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
              controller: widget.cantidadSemillasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text("Cantidad de semillas"),
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
              controller: widget.costoSemillasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text("Costo de semillas"),
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
            /*InkWell(
              onTap: () async {
                var selectedDate = await showDatePicker(
                  context: context,
                  initialDate: plantingDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );

                if (selectedDate != null) {
                  setState(() {
                    plantingDate = selectedDate;
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
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${plantingDate.day} / ${plantingDate.month} / ${plantingDate.year}',
                          style: TextStyle(
                            color: colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
            SizedBox(height: 12),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      int? cantidadSemillas =
                          int.tryParse(widget.cantidadSemillasController.text);

                      int? costoSemillas =
                          int.tryParse(widget.costoSemillasController.text);

                      CropResponseModel nuevoCultivo = CropResponseModel(
                        id: widget.initialCrop?.id,
                        name: widget.nombreController.text,
                        description: widget.descripcionController.text,
                        cantidadSemillas: cantidadSemillas,
                        costoSemillas: costoSemillas,
                        /* ??
                              widget.initialCrop!.plantPlanted,
                          variety: widget.variedadController.text,
                          usuario: widget.initialCrop!.usuario);*/
                      );

                      widget.onSave!(nuevoCultivo);
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
