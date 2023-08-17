import 'package:agrotech/config/theme_provider.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/section_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/variables/presentation/providers/variables_provider.dart';
import 'package:agrotech/variables/domain/models/medidas_model.dart';
import 'package:agrotech/variables/presentation/widgetsM/edit_medida.dart';
import 'package:agrotech/variables/presentation/widgetsM/new_medida.dart';
import 'package:agrotech/variables/presentation/widgetsM/medidasT_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrotech/config/colors_theme.dart';

class VariablesTPage extends StatefulWidget {
  const VariablesTPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VariablesTPageState createState() => _VariablesTPageState();
}

class _VariablesTPageState extends State<VariablesTPage> {
  List<Medidas> listMedidas = [];
  Medidas? selectedMedidaForEdit;
  void saveNewMedida(Medidas medida) {
    setState(() {
      listMedidas.add(medida);
    });
  }

  void editMedida(Medidas medida) {
    selectedMedidaForEdit = medida;
    showDialog(
      context: context,
      builder: (context) {
        return EditMedida(
          initialMedida: selectedMedidaForEdit,
          onSave: (EditMedida) {
            // Actualizar la lista de plagas
            setState(() {
              listMedidas.remove(selectedMedidaForEdit);
              listMedidas.add(EditMedida);
            });
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

  void deleteMedida(Medidas medida) {
    setState(() {
      listMedidas.remove(medida);
    });
  }

  void createNewMedida() {
    showDialog(
      context: context,
      builder: (context) {
        return NewMedida(
          onSave: (nuevaMedida) {
            saveNewMedida(nuevaMedida);
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
        onPressed: createNewMedida,
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
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Valor')),
                          DataColumn(label: Text('Descripción')),
                          DataColumn(label: Text('Fecha')),
                          DataColumn(label: Text('Unidad')),

                          DataColumn(
                              label: Text('Acciones')), // Columna para botones
                        ],
                        rows: listMedidas.map((e) {
                          return DataRow(
                            cells: [
                              DataCell(Text('${e.value}')),
                              DataCell(Text(e.description ?? '')),
                              DataCell(Text(
                                  '${e.date!.year}-${e.date!.month}-${e.date!.day} | ${e.date!.hour}:${e.date!.minute}' ??
                                      '')),
                              DataCell(Text(e.unit ?? '')),
                              DataCell(
                                VariablesTWidget(
                                  medida: e,
                                  onEdit: () {
                                    editMedida(e);
                                  },
                                  onDelete: () {
                                    deleteMedida(e);
                                  },
                                ),
                              )
                              // Agrega más DataCell según sea necesario
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              /* child: ListView(
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
                    ),*/
            ),
          ),
        ],
      ),
    );
  }
}
