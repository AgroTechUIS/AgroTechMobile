import 'package:agrotech/config/theme_provider.dart';
import 'package:agrotech/in_admin/presentation/providers/in_admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/services.dart';

class InAdminPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'Agrotech ',
              style: TextStyle(
                fontFamily: 'Outfit',
              ),
            ),
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/id/115/600',
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: Align(
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
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('¡Bienvenido, \$UsuarioRol:Admin!',
                            style: TextStyle(
                              color: Colors
                                  .black, // Cambia el color según tus preferencias
                              fontSize:
                                  16, // Cambia el tamaño de fuente según tus preferencias
                              fontWeight: FontWeight
                                  .normal, // )Cambia el peso de fuente según tus preferencias
                            )),
                        const Text(
                          'Gestión agricola',
                          style: TextStyle(
                            fontSize:
                                24, // Cambia el tamaño de fuente según tus preferencias
                            fontWeight: FontWeight
                                .bold, // Cambia el peso de fuente según tus preferencias
                            color: Colors
                                .blue, // Cambia el color según tus preferencias
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
                            Navigator.of(context).pushNamed('InAdminPage');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://picsum.photos/seed/264/600',
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              height: MediaQuery.sizeOf(context).height * 0.25,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFBCFF47),
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              'En este espacio podrás gestionar las plagas, los requerimientos del suelo y otra cantidad de variables ambientales de los cultivos.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize:
                                    16, // Cambia el tamaño de fuente según tus preferencias
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const Text('Gestión de productos',
                            style: TextStyle(
                                fontSize:
                                    24, // Cambia el tamaño de fuente según tus preferencias
                                fontWeight: FontWeight
                                    .bold, // Cambia el peso de fuente según tus preferencias
                                color: Colors.black)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://picsum.photos/seed/433/600',
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 65,
                          decoration: const BoxDecoration(
                            color: Color(0xFFBCFF47),
                          ),
                          child: const Text(
                            'Ingresando a este apartado tendrás la posibilidad de visualizar y gestionar los productos a la venta.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize:
                                  16, // Cambia el tamaño de fuente según tus preferencias
                              color: Colors
                                  .black, // Cambia el color según tus preferencias
                              // Agrega otras propiedades de estilo según sea necesario
                            ),
                          ),
                        ),
                        const Text('Gestión financiera',
                            style: TextStyle(
                                fontSize:
                                    24, // Cambia el tamaño de fuente según tus preferencias
                                fontWeight: FontWeight.bold)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://picsum.photos/seed/978/600',
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFFBCFF47),
                          ),
                          child: const Text(
                            'Aquí tienes la opción de visualizar y analizar los ingresos, egresos y facturas generadas en los procesos de comercialización con los productos.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors
                                  .black, // Cambia el tamaño de fuente según tus preferencias
                              // Agrega otras propiedades de estilo según sea necesario
                            ),
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
              ]),
        ),
      ),
    );
  }
}
