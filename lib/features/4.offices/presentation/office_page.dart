import 'package:agrotech/features/4.offices/presentation/widgets/edit_office.dart';
import 'package:agrotech/features/4.offices/presentation/widgets/office_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../domain/models/office_model.dart';
import 'office_controller.dart';
import 'office_state.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class OfficePage extends ConsumerWidget {
  OfficePage({super.key, required this.idEmpresa});

  final int idEmpresa;

  void editOffice(context, OfficeModel despacho, OfficeController controller,
      OfficeState state) {
    state.selectedOfficeForEdit = despacho;
    showDialog(
      context: context,
      builder: (context) {
        return EditOffice(
          initialOffice: state.selectedOfficeForEdit,
          onSave: (nc) async {
            final nca = await controller.updatesOffices(nc, despacho);

            controller.getListOffice(idEmpresa);
            Fluttertoast.showToast(
              msg: 'Despacho entregado exitosamente.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP_RIGHT,
              backgroundColor:
                  const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
              textColor: Colors.white,
            );

            Navigator.of(context).pop();
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
    var state = ref.watch(officeController);
    var controller = ref.read(officeController.notifier);
    return Scaffold(
      backgroundColor: colors.appbar,
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
                    'Despachos',
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
                children: state.despachos
                    .map((e) => OfficeWidget(
                          despacho: e,
                          onEdit: () {
                            editOffice(context, e, controller, state);
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
