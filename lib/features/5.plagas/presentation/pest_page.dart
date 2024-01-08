import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_controller.dart';
import 'package:agrotech/features/5.plagas/data/network/pest_repository_impl.dart';
import 'package:agrotech/features/5.plagas/data/network/pest_service.dart';
import 'package:agrotech/features/5.plagas/domain/models/pest_response_model.dart';
import 'package:agrotech/features/5.plagas/domain/use_cases/get_pest_use_case_impl.dart';
import 'package:agrotech/features/5.plagas/presentation/pest_controller.dart';
import 'package:agrotech/features/5.plagas/presentation/pest_state.dart';
import 'package:agrotech/features/5.plagas/presentation/widgets/edit_pest.dart';
import 'package:agrotech/features/5.plagas/presentation/widgets/new_pest.dart';
import 'package:agrotech/features/5.plagas/presentation/widgets/pest_widgets.dart';
import 'package:agrotech/features/5.tratamientos/presentation/treatment_page.dart';
import 'package:flutter/material.dart';
import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../domain/models/pest_model.dart';

class PlagasPage extends ConsumerWidget {
  //final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  //List<PlagaResponseModel> listPest = [];
  //PlagaModel? pests;
  //PlagaModel? selectedPlagaForEdit;

  //List<dynamic> lista = [];

  /*Future<List<PlagaResponseModel>> obtenerLista() async {
    try {
      List<PlagaResponseModel> dynamicList = await ccase.getListPest(idCrop: 1);

      return dynamicList;
    } catch (e) {
      // Maneja las excepciones aquí según sea necesario
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    obtenerLista();
  }

  void saveNewPest(PlagaResponseModel plaga) {
    setState(() {
      listPest.add(plaga);
    });
  }*/
  void editPest(context, PlagaResponseModel plaga, PestController controller,
      PestState state) {
    state.selectedPlagaForEdit = plaga;
    showDialog(
      context: context,
      builder: (context) {
        return EditPest(
          initialPlaga: state.selectedPlagaForEdit,
          onSave: (np) async {
            final npa = await controller.updatesPests(np, plaga);

            PlagaResponseModel plagaModel = PlagaResponseModel.fromJson(npa);
            bool existePlaga =
                controller.existePlagaEConNombre(plagaModel.name!, plagaModel);

            if (existePlaga) {
              Fluttertoast.showToast(
                msg: 'Ya existe una plaga con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.getListPest(1);
              Fluttertoast.showToast(
                msg: 'Plaga actualizada correctamente.',
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

  void deletePest(PlagaResponseModel plaga, PestController controller) {
    controller.deletePest(plaga);
    controller.updatePest(plaga);
    Fluttertoast.showToast(
      msg: 'Plaga eliminada correctamente.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
      textColor: Colors.white,
    );
  }

  void createNewPest(
      BuildContext context, PestController controller, WidgetRef ref) {
    var stateCrop = ref.watch(cropController);

    showDialog(
      context: context,
      builder: (context) {
        return NewPest(
          onSave: (nuevaPlaga) {
            bool existePlaga =
                controller.existePlagaConNombre(nuevaPlaga.name!);

            if (existePlaga) {
              Fluttertoast.showToast(
                msg: 'Ya existe una plaga con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.savePests(nuevaPlaga);
              Fluttertoast.showToast(
                msg: 'Plaga creada correctamente.',
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

  void playTreatment(BuildContext context, int idPest) {
    context.pushRoute(TratamientosPage(idPest));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(pestController);
    var controller = ref.read(pestController.notifier);

    //controller.getListPest(1);

    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewPest(context, controller, ref),
        child: const Icon(Icons.add),
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
                    'Plagas y Enfermedades',
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
              //height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                children: state.plagas
                    .map((e) => PestWidget(
                          plaga: e,
                          onTreatment: () {
                            playTreatment(context, e.id!);
                          },
                          onEdit: () {
                            editPest(context, e, controller, state);
                          },
                          onDelete: () {
                            deletePest(e, controller);
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

/*
class PlagasPage extends StatefulWidget {
  const PlagasPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlagasPageState createState() => _PlagasPageState();
}

class _PlagasPageState extends State<PlagasPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  List<dynamic> listPest = [];
  PlagaModel? pests;
  PlagaModel? selectedPlagaForEdit;

  List<dynamic> lista = [];

  final ccase = GetPestUseCaseImpl(
      PestRepositoryImpl(PestService('http://3.81.168.53:8080')));

  Future<List<PlagaResponseModel>> obtenerLista() async {
    try {
      List<PlagaResponseModel> dynamicList = await ccase.getListPest(idCrop: 1);

      return dynamicList;
    } catch (e) {
      // Maneja las excepciones aquí según sea necesario
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    obtenerLista();
  }

  void saveNewPest(PlagaModel plaga) {
    setState(() {
      listPest.add(plaga);
    });
  }

  void editPest(PlagaModel plaga) {
    selectedPlagaForEdit = plaga;
    showDialog(
      context: context,
      builder: (context) {
        return EditPest(
          initialPlaga: selectedPlagaForEdit,
          onSave: (EditPest) {
            // Actualizar la lista de plagas
            setState(() {
              listPest.remove(selectedPlagaForEdit);
              listPest.add(EditPest);
            });
            Navigator.of(context).pop();
          },
          onCancel: () {
            selectedPlagaForEdit =
                null; // Limpiar la variable temporal si se cancela
            Navigator.of(context).pop();
          },
          // Inicializa los controladores y otros campos con los valores de 'selectedPlagaForEdit'
        );
      },
    );
  }

  void deletePest(PlagaModel plaga) {
    setState(() {
      listPest.remove(plaga);
    });
  }

  void createNewPest() {
    showDialog(
      context: context,
      builder: (context) {
        return NewPest(
          onSave: (nuevaPlaga) {
            saveNewPest(nuevaPlaga);
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
        onPressed: createNewPest,
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
                    'Plagas y Enfermedades',
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
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  //await getAllPestByCrop();
                  setState(() {});
                },
                child: ListView(
                  children: lista
                      .map((e) => PestWidget(
                            plaga: e,
                            onEdit: () {
                              editPest(e);
                            },
                            onDelete: () {
                              deletePest(e);
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

*/
