import 'package:agrotech/features/5.cuidados/presentation/cuidado_controller.dart';
import 'package:agrotech/features/5.cuidados/presentation/cuidado_state.dart';
import 'package:agrotech/features/5.cuidados/presentation/widgets/care_widgets.dart';
import 'package:agrotech/features/5.cuidados/presentation/widgets/edit_care.dart';
import 'package:agrotech/features/5.cuidados/presentation/widgets/new_care.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../domain/models/cuidado_response_model.dart';

class CuidadosPage extends ConsumerWidget {
  int idCrop;
  CuidadosPage({super.key, required this.idCrop});

  List<CareResponseModel> listCares = [];
  CareResponseModel? selectedCareForEdit;

  void editCare(context, CareResponseModel cuidado, CareController controller,
      CuidadoState state) {
    state.selectedCuidadoForEdit = cuidado;
    showDialog(
      context: context,
      builder: (context) {
        return EditCare(
          initialCuidado: state.selectedCuidadoForEdit,
          onSave: (np) async {
            final npa = await controller.updatesCares(np, cuidado);

            CareResponseModel careModel = CareResponseModel.fromJson(npa);
            bool existeCare =
                controller.existeCuidadoEConNombre(careModel.name!, careModel);

            if (existeCare) {
              Fluttertoast.showToast(
                msg: 'Ya existe un cuidado con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.getListCare(idCrop);
              Fluttertoast.showToast(
                msg: 'Cuidado actualizado correctamente.',
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

  void deleteCare(CareResponseModel cuidado, CareController controller) {
    controller.deleteCare(cuidado);
    controller.updateCare(cuidado);
    Fluttertoast.showToast(
      msg: 'Cuidado eliminada correctamente.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
      textColor: Colors.white,
    );
  }

  void createNewCare(
      BuildContext context, CareController controller, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return NewCare(
          onSave: (nuevoCuidado) async {
            bool existeCuidado =
                controller.existeCuidadoConNombre(nuevoCuidado.name!);

            if (existeCuidado) {
              Fluttertoast.showToast(
                msg: 'Ya existe un cuidado con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.saveCares(nuevoCuidado, idCrop);

              controller.updateCare(nuevoCuidado);

              Fluttertoast.showToast(
                msg: 'Cuidado creado correctamente.',
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
    var state = ref.watch(careController);
    var controller = ref.read(careController.notifier);
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewCare(context, controller, ref),
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
                children: state.cuidados
                    .map((e) => CareWidget(
                          cuidado: e,
                          onEdit: () {
                            editCare(context, e, controller, state);
                          },
                          onDelete: () {
                            deleteCare(e, controller);
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
