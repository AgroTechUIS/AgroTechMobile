import 'package:agrotech/features/4.shippings/presentation/shippings_controller.dart';
import 'package:agrotech/features/4.shippings/presentation/shippings_state.dart';
import 'package:agrotech/features/4.shippings/presentation/widgets/new_shipping.dart';
import 'package:agrotech/features/4.shippings/presentation/widgets/shippings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../domain/models/shippings_model.dart';
import 'widgets/edit_shipping.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class ShippingsPage extends ConsumerWidget {
  ShippingsPage({super.key, required this.idEmpresa});

  final int idEmpresa;

  void deleteShipping(
      ShippingsResponseModel envio, ShippingController controller) {
    controller.deleteShipping(envio);
    controller.update(envio);
    Fluttertoast.showToast(
      msg: 'Envio eliminado correctamente.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
      textColor: Colors.white,
    );
  }

  void createNewShipping(BuildContext context, ShippingController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return NewShipping(
          onSave: (nuevoEnvio) async {
            bool existeEnvio =
                controller.existeEnvioConNombre(nuevoEnvio.name!);

            if (existeEnvio) {
              Fluttertoast.showToast(
                msg: 'Ya existe un envio con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.saveShippings(nuevoEnvio, idEmpresa);
              Future.delayed(const Duration(milliseconds: 500));
              await controller.getListShipping(idEmpresa);

              Fluttertoast.showToast(
                msg: 'Envio creado correctamente.',
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

  void editShipping(context, ShippingsResponseModel envio,
      ShippingController controller, ShippingState state) {
    state.selectedShippingForEdit = envio;
    showDialog(
      context: context,
      builder: (context) {
        return EditShipping(
          initialEnvio: state.selectedShippingForEdit,
          onSave: (ne) async {
            final nca = await controller.updateShipping(ne, envio, idEmpresa);

            ShippingsResponseModel shippingModel =
                ShippingsResponseModel.fromJson(nca);
            bool existeEnvio = controller.existeEnvioEConNombre(
                shippingModel.name!, shippingModel);

            if (existeEnvio) {
              Fluttertoast.showToast(
                msg: 'Ya existe un envio con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.getListShipping(idEmpresa);
              Fluttertoast.showToast(
                msg: 'Envio actualizado correctamente.',
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(shippingController);
    var controller = ref.read(shippingController.notifier);
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewShipping(context, controller),
        child: const Icon(Icons.add),
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
                    'Envios',
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
                children: state.envios
                    .map((e) => ShippingWidget(
                          envio: e,
                          onEdit: () {
                            editShipping(context, e, controller, state);
                          },
                          onDelete: () {
                            deleteShipping(e, controller);
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
