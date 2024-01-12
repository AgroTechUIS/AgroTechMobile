import 'package:agrotech/features/6.tratamientos/domain/models/treatment_response_model.dart';
import 'package:agrotech/features/6.tratamientos/presentation/treatment_controller.dart';
import 'package:agrotech/features/6.tratamientos/presentation/widgets/edit_treatment.dart';
import 'package:agrotech/features/6.tratamientos/presentation/widgets/new_treatment.dart';
import 'package:agrotech/features/6.tratamientos/presentation/widgets/treatment_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../domain/models/treatment_model.dart';

class TratamientosPage extends ConsumerWidget {
  TratamientosPage(this.idPest, {super.key});

  final int idPest;

  List<TreatmentResponseModel> listTreatments = [];
  TreatmentResponseModel? selectedTreatmentForEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(treatmentController);
    var controller = ref.read(treatmentController.notifier);
    void saveNewTreatment(TreatmentResponseModel tratamiento) {
      listTreatments.add(tratamiento);
    }

    void editTreatment(
        TreatmentResponseModel tratamiento, TreatmentController controller) {
      selectedTreatmentForEdit = tratamiento;
      showDialog(
        context: context,
        builder: (context) {
          return EditTreatment(
            initialTratamiento: selectedTreatmentForEdit,
            onSave: (nt) async {
              final nta =
                  await controller.updatesTreatments(nt, tratamiento, idPest);
              TreatmentResponseModel treatmentModel =
                  TreatmentResponseModel.fromJson(nta);
              bool existeTratamiento = controller.existeTratamientoEConNombre(
                  treatmentModel.name!, treatmentModel);

              if (existeTratamiento) {
                Fluttertoast.showToast(
                  msg: 'Ya existe un tratamiento con el mismo nombre.',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP_RIGHT,
                  backgroundColor: Colors.red, // Fondo rojo
                  textColor: Colors.white,
                );
              } else {
                controller.getListTreatment(idPest);
                Fluttertoast.showToast(
                  msg: 'Tratamiento actualizado correctamente.',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP_RIGHT,
                  backgroundColor:
                      const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
                  textColor: Colors.white,
                );
                Navigator.of(context).pop();
              }
            },
            onCancel: () {
              Navigator.of(context).pop();
            },
          );
        },
      );
    }

    void deleteTreatment(TreatmentResponseModel tratamiento) {
      controller.deleteTreatment(tratamiento);
      controller.update(tratamiento);
      Fluttertoast.showToast(
        msg: 'Tratamiento eliminado correctamente.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP_RIGHT,
        backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
        textColor: Colors.white,
      );
    }

    void createNewTreatment() {
      showDialog(
        context: context,
        builder: (context) {
          return NewTreatment(
            onSave: (nuevoTratamiento) async {
              bool existeTratamiento =
                  controller.existeTratamientoConNombre(nuevoTratamiento.name!);

              if (existeTratamiento) {
                Fluttertoast.showToast(
                  msg: 'Ya existe un tratamiento con el mismo nombre.',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP_RIGHT,
                  backgroundColor: Colors.red, // Fondo rojo
                  textColor: Colors.white,
                );
              } else {
                controller.saveTreatments(nuevoTratamiento, idPest);
                Future.delayed(const Duration(milliseconds: 500));
                await controller.getListTreatment(idPest);
                Fluttertoast.showToast(
                  msg: 'Tratamiento creado correctamente.',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP_RIGHT,
                  backgroundColor:
                      const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
                  textColor: Colors.white,
                );
              }
              Navigator.of(context).pop();
            },
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTreatment,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
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
                    'Tratamientos',
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                children: state.tratamientos
                    .map((e) => TreatmentWidget(
                          tratamiento: e,
                          onEdit: () {
                            editTreatment(e, controller);
                          },
                          onDelete: () {
                            deleteTreatment(e);
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
