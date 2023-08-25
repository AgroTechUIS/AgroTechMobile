import 'package:agrotech/cuidados/domain/models/cuidados_model.dart';
import 'package:agrotech/cuidados/presentation/widgets/care_widgets.dart';
import 'package:agrotech/cuidados/presentation/widgets/edit_care.dart';
import 'package:agrotech/cuidados/presentation/widgets/new_care.dart';
import 'package:flutter/material.dart';

import '../../config/colors_theme.dart';

class CuidadosPage extends StatefulWidget {
  const CuidadosPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CuidadosPageState createState() => _CuidadosPageState();
}

class _CuidadosPageState extends State<CuidadosPage> {
  List<Cuidados> listCares = [];
  Cuidados? selectedCareForEdit;

  void saveNewCare(Cuidados cuidado) {
    setState(() {
      listCares.add(cuidado);
    });
  }

  void editCare(Cuidados cuidado) {
    selectedCareForEdit = cuidado;
    showDialog(
      context: context,
      builder: (context) {
        return EditCare(
          initialCuidado: selectedCareForEdit,
          onSave: (EditCare) {
            // Actualizar la lista de plagas
            setState(() {
              listCares.remove(selectedCareForEdit);
              listCares.add(EditCare);
            });
            Navigator.of(context).pop();
          },
          onCancel: () {
            selectedCareForEdit =
                null; // Limpiar la variable temporal si se cancela
            Navigator.of(context).pop();
          },
          // Inicializa los controladores y otros campos con los valores de 'selectedPlagaForEdit'
        );
      },
    );
  }

  void deleteCare(Cuidados cuidado) {
    setState(() {
      listCares.remove(cuidado);
    });
  }

  void createNewCare() {
    showDialog(
      context: context,
      builder: (context) {
        return NewCare(
          onSave: (nuevoCuidado) {
            saveNewCare(nuevoCuidado);
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewCare,
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
                    'Cuidados del cultivo',
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
                children: listCares
                    .map((e) => CareWidget(
                          cuidado: e,
                          onEdit: () {
                            editCare(e);
                          },
                          onDelete: () {
                            deleteCare(e);
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
