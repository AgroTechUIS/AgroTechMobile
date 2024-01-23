// coverage:ignore-file
// ignore_for_file: use_build_context_synchronously

import 'package:agrotech/features/6.medidas/domain/models/measure_response_model.dart';
import 'package:agrotech/features/6.medidas/presentation/measure_controller.dart';
import 'package:agrotech/features/6.medidas/presentation/widgets/edit_medida.dart';
import 'package:agrotech/features/6.medidas/presentation/widgets/medidasT_widget.dart';
import 'package:agrotech/features/6.medidas/presentation/widgets/new_medida.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';

class VariablesTPage extends ConsumerWidget {
  VariablesTPage(this.idVariable, {super.key});

  final int idVariable;

  List<MeasureResponseModel> listMedidas = [];
  MeasureResponseModel? selectedMedidaForEdit;
  void saveNewMedida(MeasureResponseModel medida) {
    listMedidas.add(medida);
  }

  void editMedida(BuildContext context, MeasureResponseModel medida, MeasureController controller) {
    selectedMedidaForEdit = medida;
    showDialog(
      context: context,
      builder: (context) {
        return EditMedida(
          initialMedida: selectedMedidaForEdit,
          onSave: (ne) async {
            final npa = await controller.updatesMeasures(ne, medida, idVariable);

            MeasureResponseModel measureModel = MeasureResponseModel.fromJson(npa);

            controller.getListMeasure(idVariable);
            Fluttertoast.showToast(
              msg: 'Variable actualizada correctamente.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP_RIGHT,
              backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
              textColor: Colors.white,
            );
            Navigator.of(context).pop();
          },
          onCancel: () {
            selectedMedidaForEdit = null;
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void deleteMedida(MeasureResponseModel medida, MeasureController controller) {
    controller.deleteMeasure(medida);
    controller.updateMeasure(medida);
    Fluttertoast.showToast(
      msg: 'Medida eliminada correctamente.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
      textColor: Colors.white,
    );
  }

  void createNewMedida(BuildContext context, MeasureController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return NewMedida(
          onSave: (nuevaMedida) async {
            controller.saveMeasures(nuevaMedida, idVariable);
            Future.delayed(const Duration(milliseconds: 500));
            await controller.getListMeasure(idVariable);
            Fluttertoast.showToast(
              msg: 'Medida creada correctamente.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP_RIGHT,
              backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
              textColor: Colors.white,
            );
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(measureController);
    var controller = ref.read(measureController.notifier);
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewMedida(context, controller),
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Variables ambientales',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Valor')),
                      DataColumn(label: Text('Descripción')),
                      DataColumn(label: Text('Fecha')),
                      DataColumn(label: Text('Unidad')),
                      DataColumn(label: Text('Acciones')), // Columna para botones
                    ],
                    rows: state.medidas.map((e) {
                      return DataRow(
                        cells: [
                          DataCell(Text('${e.measurement_value}')),
                          DataCell(Text(e.description ?? '')),
                          DataCell(Text(
                              '${e.date!.year}-${e.date!.month}-${e.date!.day} | ${e.date!.hour}:${e.date!.minute}')),
                          DataCell(Text(e.measuring_unit ?? '')),
                          DataCell(
                            VariablesTWidget(
                              medida: e,
                              onEdit: () {
                                editMedida(context, e, controller);
                              },
                              onDelete: () {
                                deleteMedida(e, controller);
                              },
                            ),
                          )
                          // Agrega más DataCell según sea necesario
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
