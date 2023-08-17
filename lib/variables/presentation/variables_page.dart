import 'package:agrotech/config/theme_provider.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/section_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/variables/presentation/providers/variables_provider.dart';
import 'package:agrotech/variables/domain/models/variables_model.dart';
import 'package:agrotech/variables/presentation/widgets/edit_variable.dart';
import 'package:agrotech/variables/presentation/widgets/new_variable.dart';
import 'package:agrotech/variables/presentation/widgets/variable_widgets.dart';
import 'package:agrotech/variables/presentation/widgets/variablesTablas_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrotech/config/colors_theme.dart';

class VariablesPage extends StatefulWidget {
  const VariablesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VariablesPageState createState() => _VariablesPageState();
}

class _VariablesPageState extends State<VariablesPage> {
  List<Variables> listVariables = [];
  Variables? selectedVariableForEdit;
  void saveNewVariable(Variables variable) {
    setState(() {
      listVariables.add(variable);
    });
  }

  void editVariable(Variables variable) {
    selectedVariableForEdit = variable;
    showDialog(
      context: context,
      builder: (context) {
        return EditVariable(
          initialVariable: selectedVariableForEdit,
          onSave: (EditVariable) {
            // Actualizar la lista de plagas
            setState(() {
              listVariables.remove(selectedVariableForEdit);
              listVariables.add(EditVariable);
            });
            Navigator.of(context).pop();
          },
          onCancel: () {
            selectedVariableForEdit =
                null; // Limpiar la variable temporal si se cancela
            Navigator.of(context).pop();
          },
          // Inicializa los controladores y otros campos con los valores de 'selectedPlagaForEdit'
        );
      },
    );
  }

  void deleteVariable(Variables variable) {
    setState(() {
      listVariables.remove(variable);
    });
  }

  void createNewVariable() {
    showDialog(
      context: context,
      builder: (context) {
        return NewVariable(
          onSave: (nuevaVariable) {
            saveNewVariable(nuevaVariable);
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewVariable,
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
                children: listVariables
                    .map((e) => VariablesWidget(
                          variable: e,
                          onEdit: () {
                            editVariable(e);
                          },
                          onDelete: () {
                            deleteVariable(e);
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
