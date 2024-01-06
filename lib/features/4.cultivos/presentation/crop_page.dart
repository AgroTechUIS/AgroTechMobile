import 'package:agrotech/features/4.cultivos/domain/models/crop_response_model.dart';
import 'package:agrotech/features/4.cultivos/domain/use_cases/get_crop_use_case_impl.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_controller.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_state.dart';
import 'package:agrotech/features/4.cultivos/presentation/widgets/crop_widgets.dart';
import 'package:agrotech/features/4.cultivos/presentation/widgets/edit_crop.dart';
import 'package:agrotech/features/4.cultivos/presentation/widgets/new_crop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../../5.plagas/presentation/pest_page.dart';
import '../data/network/crop_repository_impl.dart';
import '../data/network/crop_service.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class CropPage extends ConsumerWidget {
  final ccase = GetCropUseCaseImpl(CropRepositoryImpl(CropService()));

  void deleteCrop(CropResponseModel cultivo, CropController controller) {
    controller.deleteCrop(cultivo);
    controller.updateCrop(cultivo);
    Fluttertoast.showToast(
      msg: 'Cultivo eliminado correctamente.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
      textColor: Colors.white,
    );
  }

  void createNewCrop(BuildContext context, CropController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return NewCrop(
          onSave: (nuevoCultivo) {
            bool existeCultivo =
                controller.existeCultivoConNombre(nuevoCultivo.name!);

            if (existeCultivo) {
              Fluttertoast.showToast(
                msg: 'Ya existe un cultivo con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.saveCrops(nuevoCultivo);
              Fluttertoast.showToast(
                msg: 'Cultivo creado correctamente.',
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

  void editCrop(context, CropResponseModel cultivo, CropController controller,
      CropState state) {
    state.selectedCropForEdit = cultivo;
    showDialog(
      context: context,
      builder: (context) {
        return EditCrop(
          initialCrop: state.selectedCropForEdit,
          onSave: (nc) async {
            final nca = await controller.updatesCrops(nc, cultivo);

            CropResponseModel cultivoModel = CropResponseModel.fromJson(nca);
            bool existeCultivo = controller.existeCultivoEConNombre(
                cultivoModel.name!, cultivoModel);

            if (existeCultivo) {
              Fluttertoast.showToast(
                msg: 'Ya existe un cultivo con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.getListCrop("jorgesandoval529@gmail.com");
              Fluttertoast.showToast(
                msg: 'Cultivo actualizado correctamente.',
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

  void playCrop() {
    PlagasPage();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(cropController);
    var controller = ref.read(cropController.notifier);
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewCrop(context, controller),
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
                    'CULTIVOS',
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
                children: state.cultivos
                    .map((e) => CropWidget(
                          cultivo: e,
                          onPlay: () {
                            playCrop();
                          },
                          onEdit: () {
                            editCrop(context, e, controller, state);
                          },
                          onDelete: () {
                            deleteCrop(e, controller);
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
