// ignore: must_be_immutable
import 'package:agrotech/features/4.cultivos/domain/models/plant_model.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../../5.cuidados/presentation/widgets/my_buttom.dart';
import '../../domain/models/crop_response_model.dart';

class NewCrop extends ConsumerStatefulWidget {
  void Function(CropResponseModel)? onSave;
  VoidCallback? onCancel;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController cantidadSemillasController =
      TextEditingController();
  final TextEditingController costoSemillasController = TextEditingController();

  NewCrop({super.key, this.onSave, this.onCancel});
  @override
  _NewCropState createState() => _NewCropState();
}

class _NewCropState extends ConsumerState<NewCrop> {
  DateTime? date = DateTime.now();
  late Future<DateTime?> fecha;

  String? valorInicial = null;
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(cropController);
    var controller = ref.read(cropController.notifier);
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Crea un nuevo cultivo"),
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
                    'Cuando se realizó el cultivo:',
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
                label: const Text("Plantas sembradas"),
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
            DropdownButton<PlantResponseModel>(
              value: state.selectedPlant,
              items: state.plants.map((PlantResponseModel item) {
                return DropdownMenuItem<PlantResponseModel>(
                  value: item,
                  child: Row(
                    children: [
                      Text('${item.name}'),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (PlantResponseModel? newValue) {
                if (newValue != null) controller.updatePlants(newValue);
              },
            ),
            SizedBox(height: 12),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Guardar",
                    onPressed: () {
                      int? costoValue;
                      String costoText =
                          widget.costoSemillasController.value.toString();

                      if (costoText.isNotEmpty) {
                        costoValue = int.tryParse(costoText);
                      }

                      int? cantidadValue;
                      String cantidadText =
                          widget.cantidadSemillasController.value.toString();

                      if (cantidadText.isNotEmpty) {
                        cantidadValue = int.tryParse(cantidadText);
                      }
                      String costoText2 = widget.costoSemillasController.text;
                      String cantidadText2 =
                          widget.cantidadSemillasController.text;

                      CropResponseModel nuevoCultivo;
                      if (state.selectedPlant != null) {
                        nuevoCultivo = CropResponseModel(
                            name: widget.nombreController.text,
                            description: widget.descripcionController.text,
                            cantidadSemillas: cantidadText2.isNotEmpty
                                ? int.parse(cantidadText2)
                                : 0,
                            costoSemillas: cantidadText2.isNotEmpty
                                ? double.parse(costoText2)
                                : 0,
                            idPlanta: state.selectedPlant!.name,
                            planta: state.selectedPlant!.id
                            //usuario: UserEmail(email: "jorgesandoval529@gmail.com"),
                            );
                        widget.onSave!(nuevoCultivo);
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Debes asignar un valor de planta.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP_RIGHT,
                          backgroundColor: Colors.red, // Fondo rojo
                          textColor: Colors.white,
                        );
                      }
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
