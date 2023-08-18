import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/1.asignacion_cultivos/actividad_cultivo_page/actividad_cultivo_page.dart';
import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsigCultivoPage extends ConsumerWidget {
  AsigCultivoPage({super.key});

  Map<String, String?> asignaciones = {};
  List<String> personal = [
    'Personal 1',
    'Personal 2',
    'Personal 3',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: colors.backgroundwhite,
      appBar: AppBar(
        title: const Text('Informe Agro Tech'),
        centerTitle: true,
        backgroundColor: colors.appbar,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              netImages.background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const HeaderPageWidget('Asignacion de cultivos'),
            SectionScrollWidget(
              children: [
                CustomCardWidget(
                  title: 'Cultivo de Naranja\nN°1234',
                  subtitle: 'Finca del Sol',
                  content: const [
                    'Direccion: Calle Principal 123',
                    'Zona: zona A',
                  ],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/vertical-shot-orange-fruit-tree_181624-12354.jpg?size=626&ext=jpg',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActCultivoPage()),
                  ),
                  buttonText: 'Administrar Actividades',
                ),
                CustomCardWidget(
                  title: 'Cultivo de Mora\nN°1235',
                  subtitle: 'Finca del Sol',
                  content: const [
                    'Direccion: Calle Principal 123',
                    'Zona: zona A',
                  ],
                  imagenUrl: 'https://img.freepik.com/premium-photo/blackberries_611759-66.jpg',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActCultivoPage()),
                  ),
                  buttonText: 'Administrar Actividades',
                ),
                CustomCardWidget(
                  title: 'Cultivo de Naranja\nN°1236',
                  subtitle: 'Finca del Sol',
                  content: const [
                    'Direccion: Calle Principal 123',
                    'Zona: zona A',
                  ],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/vertical-shot-orange-fruit-tree_181624-12354.jpg?size=626&ext=jpg',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActCultivoPage()),
                  ),
                  buttonText: 'Administrar Actividades',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarModalAsignacion(String cultivo, BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: colors.white,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Asignar Personal a $cultivo',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  DropdownButton<String>(
                    value: asignaciones[cultivo],
                    hint: Text('Seleccione un personal'),
                    items: personal.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        asignaciones[cultivo] = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Asignar'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
