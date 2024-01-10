import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/features/5.variables/domain/models/variable_model.dart';
import 'package:agrotech/features/5.variables/domain/models/variable_response_model.dart';
import 'package:agrotech/features/5.variables/presentation/variable_controller.dart';
import 'package:agrotech/features/5.variables/presentation/widgets/edit_variable.dart';
import 'package:agrotech/features/5.variables/presentation/widgets/new_variable.dart';
import 'package:agrotech/features/5.variables/presentation/widgets/variable_widgets.dart';
import 'package:agrotech/features/6.medidas/presentation/measure_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../../6.medidas/presentation/measure_controller.dart';

class VariablesPage extends ConsumerWidget {
  VariablesPage({super.key, required this.idCrop});

  final int idCrop;
  @override
  // ignore: library_private_types_in_public_api

  List<VariableResponseModel> listVariables = [];
  VariableResponseModel? selectedVariableForEdit;
  void saveNewVariable(VariableResponseModel variable) {
    listVariables.add(variable);
  }

  void playVariable(BuildContext context, int idVariable, WidgetRef ref) async {
    await ref.read(measureController.notifier).getListMeasure(idVariable);
    context.pushRoute(VariablesTPage(idVariable));
  }

  void editVariable(
      context, VariableResponseModel variable, VariableController controller) {
    selectedVariableForEdit = variable;
    showDialog(
      context: context,
      builder: (context) {
        return EditVariable(
          initialVariable: selectedVariableForEdit,
          onSave: (nv) async {
            final npa = await controller.updatesVariables(nv, variable, idCrop);

            VariableResponseModel variableModel =
                VariableResponseModel.fromJson(npa);
            bool existeVariable = controller.existeVariableEConNombre(
                variableModel.name!, variableModel);

            if (existeVariable) {
              Fluttertoast.showToast(
                msg: 'Ya existe una variable con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.getListVariable(idCrop);
              Fluttertoast.showToast(
                msg: 'Variable actualizada correctamente.',
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

  void deleteVariable(
      VariableResponseModel variable, VariableController controller) {
    controller.deleteVariable(variable);
    controller.updateVariable(variable);
    Fluttertoast.showToast(
      msg: 'Variable eliminada correctamente.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
      textColor: Colors.white,
    );
  }

  void createNewVariable(BuildContext context, VariableController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return NewVariable(
          onSave: (nuevaVariable) async {
            bool existePlaga =
                controller.existeVariableConNombre(nuevaVariable.name!);

            if (existePlaga) {
              Fluttertoast.showToast(
                msg: 'Ya existe una variable con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.saveVariables(nuevaVariable, idCrop);
              Future.delayed(const Duration(milliseconds: 500));
              await controller.getListVariable(idCrop);
              Fluttertoast.showToast(
                msg: 'Variable creada correctamente.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor:
                    const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
                textColor: Colors.white,
              );
              Navigator.of(context).pop();
            }
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(variableController);
    var controller = ref.read(variableController.notifier);
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewVariable(context, controller),
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                children: state.variables
                    .map((e) => VariablesWidget(
                          variable: e,
                          onVariable: () {
                            playVariable(context, e.id!, ref);
                          },
                          onEdit: () {
                            editVariable(context, e, controller);
                          },
                          onDelete: () {
                            deleteVariable(e, controller);
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
