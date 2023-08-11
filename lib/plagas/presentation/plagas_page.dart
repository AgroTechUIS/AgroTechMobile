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
                  idPlaga: 1,
                  nombrePlaga: nombreController.text,
                  descripcionPlaga: descripcionController.text,
                  estadoPlaga: estadoController.text,
                  observacionPlaga: observacionController.text,
                  fechaPlaga: fechaPlagaController.text,
                  familiaPlaga: familiaPlagaController.text,
                  tratamientoPlaga: tratamientoPlagaController.text,
                  cropPlaga: cropPlagaController.text,
                );

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
  List<Widget> plagasWidgets = [];

  Plaga plaga = Plaga(
    idPlaga: 0,
    nombrePlaga: 'Plaga 1',
    descripcionPlaga: 'Moscas pisando los cultivos',
    estadoPlaga: 'No me acuerdo cuáles eran',
    observacionPlaga: 'Son muchisimas moscas hay que fumigar.',
    fechaPlaga: '09/08/2023',
    familiaPlaga: 'Insectos',
    tratamientoPlaga: 'No me acuerdo tampoco',
    cropPlaga: 'Ni idea de esta chimbada',
  );

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
    final nuevoWidget = Column(
      children: [
        SingleChildScrollView(
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
                            print(plaga.nombrePlaga);
                            _editarCampos(plaga);
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
        ),
      ],
    );

    setState(() {
      plagasWidgets.add(nuevoWidget);
    });
  }

  void _editarCampos(Plaga plaga) async {
    nombreController.text = plaga.nombrePlaga ?? '';
    descripcionController.text = plaga.descripcionPlaga ?? '';
    estadoController.text = plaga.estadoPlaga ?? '';
    observacionController.text = plaga.observacionPlaga ?? '';
    fechaPlagaController.text = plaga.fechaPlaga ?? '';
    familiaPlagaController.text = plaga.familiaPlaga ?? '';
    tratamientoPlagaController.text = plaga.tratamientoPlaga ?? '';
    cropPlagaController.text = plaga.cropPlaga ?? '';

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
              // Aquí puedes actualizar los valores de los campos con los nuevos valores ingresados
              setState(() {
                plaga.nombrePlaga = nombreController.text;
                plaga.descripcionPlaga = descripcionController.text;
                plaga.estadoPlaga = estadoController.text;
                plaga.observacionPlaga = observacionController.text;
                plaga.fechaPlaga = fechaPlagaController.text;
                plaga.familiaPlaga = familiaPlagaController.text;
                plaga.tratamientoPlaga = tratamientoPlagaController.text;
                plaga.cropPlaga = cropPlagaController.text;
              });
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String subtitleText = 'Plaga';

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
      body: Column(children: [
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


  /* 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'Agrotech ',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w900,
                fontSize: 23,
              ),
            ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Image.asset(
                '../../assets/appBar.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('../../assets/menuAdmin.jfif'))),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  0,
                  0,
                  10,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      decoration: const BoxDecoration(
                          color: Color(
                              0xB5B6EBD9)), // Color de fondo del Container
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            const Text(
                                '¡Bienvenido a la gestión de plagas, \$UsuarioRol:Admin!',
                                style: TextStyle(
                                  color: Colors
                                      .black, // Cambia el color según tus preferencias
                                  fontSize:
                                      16, // Cambia el tamaño de fuente según tus preferencias
                                  fontWeight: FontWeight
                                      .w900, // )Cambia el peso de fuente según tus preferencias
                                )),
                            const SizedBox(height: 10),
                            SectionWidget(children: [
                              const SubtitleWidget('Mis datos:'),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 40,
                                                foregroundColor: colors.infoBox,
                                                backgroundImage: const NetworkImage(
                                                    'https://cdn-icons-png.flaticon.com/512/3135/3135768.png'),
                                              ),
                                              Expanded(
                                                child: SectionWidget(
                                                  background: colors.appbar,
                                                  children: [
                                                    Text(
                                                      'Id: 12345',
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const TextItemWidget(
                                              title: 'Nombre:',
                                              text:
                                                  'Sergio Andres Sánchez Niño'),
                                          const TextItemWidget(
                                              title: 'Cedula:',
                                              text: '1098816863'),
                                          const TextItemWidget(
                                              title: 'Correo:',
                                              text: 'financiero@agrotech.com'),
                                          const TextItemWidget(
                                              title: 'Teléfono:',
                                              text: '30000000'),
                                          const TextItemWidget(
                                              title: 'Cargo:',
                                              text: 'Gestor financiero'),
                                          const TextItemWidget(
                                              title: 'Rol:',
                                              text: 'Financiero'),
                                          const TextItemWidget(
                                              title: 'Ingreso:',
                                              text: '19/702020'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    8), // Cambia el radio de las esquinas
                                color: Color.fromARGB(134, 158, 162, 166),
                              ),
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              child: Card(
                                color: null,
                                child: Column(children: [
                                  const Text(
                                    'Gestión de productos',
                                    style: TextStyle(
                                      fontSize:
                                          24, // Cambia el tamaño de fuente según tus preferencias
                                      fontWeight: FontWeight
                                          .bold, // Cambia el peso de fuente según tus preferencias
                                      color: Colors.black,
                                      // Cambia el color según tus preferencias
                                      // Agrega otras propiedades de estilo según sea necesario
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (Navigator.of(context).canPop()) {
                                        Navigator.of(context).pop();
                                      }
                                      Navigator.of(context)
                                          .pushNamed('InAdminPage');
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://picsum.photos/seed/264/600',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 95,
                                    child: const Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        'Ingresando a acá tendrás la posibilidad de gestionar los productos generados de la agricultura.',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize:
                                              16, // Cambia el tamaño de fuente según tus preferencias
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    8), // Cambia el radio de las esquinas
                                color: Color.fromARGB(134, 158, 162, 166),
                              ),
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              child: Card(
                                color: null,
                                child: Column(children: [
                                  const Text(
                                    'Gestión de productos',
                                    style: TextStyle(
                                      fontSize:
                                          24, // Cambia el tamaño de fuente según tus preferencias
                                      fontWeight: FontWeight
                                          .bold, // Cambia el peso de fuente según tus preferencias
                                      color: Colors.black,
                                      // Cambia el color según tus preferencias
                                      // Agrega otras propiedades de estilo según sea necesario
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (Navigator.of(context).canPop()) {
                                        Navigator.of(context).pop();
                                      }
                                      Navigator.of(context)
                                          .pushNamed('InAdminPage');
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://picsum.photos/seed/264/600',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 95,
                                    child: const Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        'Aquí tienes la opción de visualizar y analizar los ingresos, egresos y facturas generadas en los procesos de comercialización con los productos.',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize:
                                              16, // Cambia el tamaño de fuente según tus preferencias
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(
                                    0xFFBCFF47), // Cambia el color de fondo según tus preferencias
                                onPrimary: Colors
                                    .black, // Cambia el color del texto según tus preferencias
                                elevation: 3,
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.exit_to_app,
                                    color: Color(
                                        0xFFBCFF47), // Cambia el color del ícono según tus preferencias
                                    size: 15,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Cerrar sesión',
                                    style: TextStyle(
                                      fontSize:
                                          16, // Cambia el tamaño de fuente según tus preferencias
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}*/