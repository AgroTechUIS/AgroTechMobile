import 'package:agrotech/config/theme_provider.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/section_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/plagas/presentation/providers/plagas_provider.dart';
import 'package:agrotech/plagas/domain/models/plagas_model.dart';

import 'package:agrotech/plagas/presentation/widgets/text_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/services.dart';

class PlagaForm extends StatefulWidget {
  final Function(Plaga) onGuardar;

  PlagaForm({required this.onGuardar});

  @override
  _PlagaFormState createState() => _PlagaFormState();
}

class _PlagaFormState extends State<PlagaForm> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController observacionController = TextEditingController();
  TextEditingController fechaPlagaController = TextEditingController();
  TextEditingController familiaPlagaController = TextEditingController();
  TextEditingController tratamientoPlagaController = TextEditingController();
  TextEditingController cropPlagaController = TextEditingController();
  int lastPlagaId = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
            controller: nombreController,
            decoration: InputDecoration(labelText: 'Nombre')),
        TextField(
            controller: descripcionController,
            decoration: InputDecoration(labelText: 'Descripción')),
        TextField(
            controller: estadoController,
            decoration: InputDecoration(labelText: 'Estado')),
        TextField(
            controller: observacionController,
            decoration: InputDecoration(labelText: 'Observación')),
        TextField(
            controller: fechaPlagaController,
            decoration: InputDecoration(labelText: 'Fecha de aparición')),
        TextField(
            controller: familiaPlagaController,
            decoration: InputDecoration(labelText: 'Familia')),
        TextField(
            controller: tratamientoPlagaController,
            decoration: InputDecoration(labelText: 'Tratamiento')),
        TextField(
            controller: cropPlagaController,
            decoration: InputDecoration(labelText: 'CROP')),
        SizedBox(height: 15),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Plaga nuevaPlaga = Plaga(
                  idPlaga: lastPlagaId,
                  nombrePlaga: nombreController.text,
                  descripcionPlaga: descripcionController.text,
                  estadoPlaga: estadoController.text,
                  observacionPlaga: observacionController.text,
                  fechaPlaga: fechaPlagaController.text,
                  familiaPlaga: familiaPlagaController.text,
                  tratamientoPlaga: tratamientoPlagaController.text,
                  cropPlaga: cropPlagaController.text,
                );

                lastPlagaId++;

                widget.onGuardar(nuevaPlaga); // Llamar a la función de guardar
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: Text('Guardar'),
            ),
            SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: Text('Cancelar'),
            ),
          ],
        ),
      ],
    );
  }
}

class PlagasPage extends StatefulWidget {
  const PlagasPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlagasPageState createState() => _PlagasPageState();
}

class _PlagasPageState extends State<PlagasPage> {
  String? nombre;
  List<Plaga> plagas = [];

  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController observacionController = TextEditingController();
  TextEditingController fechaPlagaController = TextEditingController();
  TextEditingController familiaPlagaController = TextEditingController();
  TextEditingController tratamientoPlagaController = TextEditingController();
  TextEditingController cropPlagaController = TextEditingController();

  void _agregarPlagaWidget(Plaga plaga) {
    final nuevoWidget = SingleChildScrollView(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    foregroundColor: colors.infoBox,
                    backgroundImage: const AssetImage(
                      '../../assets/plagaCircle.png',
                    ),
                  ),
                  Expanded(
                    child: SectionWidget(
                      background: colors.appbar,
                      children: [
                        Text(
                          'Nombre: ${plaga.nombrePlaga ?? ''}',
                          style: TextStyle(
                            fontSize: 25,
                            color: colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextItemWidget(
                title: 'Descripción:',
                text: plaga.descripcionPlaga ?? '',
              ),
              const SizedBox(height: 10),
              TextItemWidget(
                title: 'Estado:',
                text: plaga.estadoPlaga ?? '',
              ),
              TextItemWidget(
                title: 'Observación:',
                text: plaga.observacionPlaga ?? '',
              ),
              TextItemWidget(
                title: 'Fecha de aparición:',
                text: plaga.fechaPlaga ?? '',
              ),
              TextItemWidget(
                title: 'Familia:',
                text: plaga.familiaPlaga ?? '',
              ),
              TextItemWidget(
                title: 'Tratamiento:',
                text: plaga.tratamientoPlaga ?? '',
              ),
              TextItemWidget(
                title: 'CROP:',
                text: plaga.cropPlaga ?? '',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.lightBlue[100],
                      child: const Icon(Icons.edit),
                      onPressed: () {
                        _editarCampos(plaga.idPlaga);
                      },
                    ),
                    const SizedBox(width: 15),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      child: const Icon(Icons.cancel),
                      onPressed: () {},
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    setState(() {
      plagas.add(plaga);
    });
  }

  void _editarCampos(int idplagaEditar) async {
    Plaga plagaEditar =
        plagas.firstWhere((plaga) => plaga.idPlaga == idplagaEditar);

    nombreController.text = plagaEditar.nombrePlaga ?? '';
    descripcionController.text = plagaEditar.descripcionPlaga ?? '';
    estadoController.text = plagaEditar.estadoPlaga ?? '';
    observacionController.text = plagaEditar.observacionPlaga ?? '';
    fechaPlagaController.text = plagaEditar.fechaPlaga ?? '';
    familiaPlagaController.text = plagaEditar.familiaPlaga ?? '';
    tratamientoPlagaController.text = plagaEditar.tratamientoPlaga ?? '';
    cropPlagaController.text = plagaEditar.cropPlaga ?? '';

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Editar campos'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          SingleChildScrollView(
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Editar nombre',
                  ),
                ),
                TextFormField(
                  controller: descripcionController,
                  decoration: const InputDecoration(
                    labelText: 'Editar descripción',
                  ),
                ),
                TextFormField(
                  controller: estadoController,
                  decoration: const InputDecoration(
                    labelText: 'Editar estado',
                  ),
                ),
                TextFormField(
                  controller: observacionController,
                  decoration: const InputDecoration(
                    labelText: 'Editar observación',
                  ),
                ),
                TextFormField(
                  controller: fechaPlagaController,
                  decoration: const InputDecoration(
                    labelText: 'Editar fecha de aparición',
                  ),
                ),
                TextFormField(
                  controller: familiaPlagaController,
                  decoration: const InputDecoration(
                    labelText: 'Editar familia',
                  ),
                ),
                TextFormField(
                  controller: tratamientoPlagaController,
                  decoration: const InputDecoration(
                    labelText: 'Editar tratamiento',
                  ),
                ),
                TextFormField(
                  controller: cropPlagaController,
                  decoration: const InputDecoration(
                    labelText: 'Editar CROP',
                  ),
                )
              ],
            )), // Puedes agregar campos de edición aquí
          )
        ]),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                Plaga plagaEncontrada = plagas.firstWhere(
                    (plaga) => plaga.idPlaga == plagaEditar.idPlaga);
                plagaEncontrada.nombrePlaga = nombreController.text;
                plagaEncontrada.descripcionPlaga = descripcionController.text;
                plagaEncontrada.estadoPlaga = estadoController.text;
                plagaEncontrada.observacionPlaga = observacionController.text;
                plagaEncontrada.fechaPlaga = fechaPlagaController.text;
                plagaEncontrada.familiaPlaga = familiaPlagaController.text;
                plagaEncontrada.tratamientoPlaga =
                    tratamientoPlagaController.text;
                plagaEncontrada.cropPlaga = cropPlagaController.text;
              });

              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  Widget _buildPlagaWidget(Plaga plaga) {
    return SingleChildScrollView(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    foregroundColor: colors.infoBox,
                    backgroundImage: const AssetImage(
                      '../../assets/plagaCircle.png',
                    ),
                  ),
                  Expanded(
                    child: SectionWidget(
                      background: colors.appbar,
                      children: [
                        Text(
                          'Nombre: ${plaga.nombrePlaga ?? ''}',
                          style: TextStyle(
                            fontSize: 25,
                            color: colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextItemWidget(
                title: 'Descripción:',
                text: plaga.descripcionPlaga ?? '',
              ),
              const SizedBox(height: 10),
              TextItemWidget(
                title: 'Estado:',
                text: plaga.estadoPlaga ?? '',
              ),
              TextItemWidget(
                title: 'Observación:',
                text: plaga.observacionPlaga ?? '',
              ),
              TextItemWidget(
                title: 'Fecha de aparición:',
                text: plaga.fechaPlaga ?? '',
              ),
              TextItemWidget(
                title: 'Familia:',
                text: plaga.familiaPlaga ?? '',
              ),
              TextItemWidget(
                title: 'Tratamiento:',
                text: plaga.tratamientoPlaga ?? '',
              ),
              TextItemWidget(
                title: 'CROP:',
                text: plaga.cropPlaga ?? '',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.lightBlue[100],
                      child: const Icon(Icons.edit),
                      onPressed: () {
                        print('ID: ${plaga.idPlaga}');
                        _editarCampos(plaga.idPlaga);
                      },
                    ),
                    const SizedBox(width: 15),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      child: const Icon(Icons.cancel),
                      onPressed: () {},
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String subtitleText = 'Plaga';
// Genera los widgets a partir de los objetos Plaga en la lista plagas
    List<Widget> plagasWidgets =
        plagas.map((plaga) => _buildPlagaWidget(plaga)).toList();
    return Scaffold(
      appBar: AppBar(
        // const iconTheme: IconThemeData(color: Colors.green),
        title: const Center(
          child: Text(
            'Plagas',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
      ),
      body: ListView(children: [
        for (var widgetPlaga in plagasWidgets)
          Column(
            children: [
              widgetPlaga,
              SizedBox(height: 16),
            ],
          ),
      ]),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Color.fromRGBO(31, 233, 20, 0.612),
            child: Icon(Icons.add_box),
            onPressed: () {
              nombreController.clear();
              descripcionController.clear();
              estadoController.clear();
              observacionController.clear();
              fechaPlagaController.clear();
              familiaPlagaController.clear();
              tratamientoPlagaController.clear();
              cropPlagaController.clear();
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Nueva Plaga'),
                      content: PlagaForm(
                        onGuardar: _agregarPlagaWidget,
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
