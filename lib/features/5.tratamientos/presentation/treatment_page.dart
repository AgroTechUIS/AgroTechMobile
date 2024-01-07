import 'package:agrotech/features/5.tratamientos/domain/models/treatment_response_model.dart';
import 'package:agrotech/features/5.tratamientos/presentation/widgets/edit_treatment.dart';
import 'package:agrotech/features/5.tratamientos/presentation/widgets/new_treatment.dart';
import 'package:agrotech/features/5.tratamientos/presentation/widgets/treatment_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../domain/models/treatment_model.dart';

class TratamientosPage extends StatefulWidget {
  @override
  const TratamientosPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TratamientosPageState createState() => _TratamientosPageState();
}

class _TratamientosPageState extends State<TratamientosPage> {
  List<TreatmentResponseModel> listTreatments = [];
  TreatmentResponseModel? selectedTreatmentForEdit;

  void saveNewTreatment(TreatmentResponseModel tratamiento) {
    setState(() {
      listTreatments.add(tratamiento);
    });
  }

  void editTreatment(TreatmentResponseModel tratamiento) {
    selectedTreatmentForEdit = tratamiento;
    showDialog(
      context: context,
      builder: (context) {
        return EditTreatment(
          initialTratamiento: selectedTreatmentForEdit,
          onSave: (editTreatment) {
            setState(() {
              listTreatments.remove(selectedTreatmentForEdit);
              listTreatments.add(editTreatment);
            });
            Navigator.of(context).pop();
          },
          onCancel: () {
            selectedTreatmentForEdit =
                null; // Limpiar la variable temporal si se cancela
            Navigator.of(context).pop();
          },
          // Inicializa los controladores y otros campos con los valores de 'selectedPlagaForEdit'
        );
      },
    );
  }

  void deleteTreatment(TreatmentResponseModel tratamiento) {
    setState(() {
      listTreatments.remove(tratamiento);
    });
  }

  void createNewTreatment() {
    showDialog(
      context: context,
      builder: (context) {
        return NewTreatment(
          onSave: (nuevoTratamiento) {
            saveNewTreatment(nuevoTratamiento);
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
                children: listTreatments
                    .map((e) => TreatmentWidget(
                          tratamiento: e,
                          onEdit: () {
                            editTreatment(e);
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
