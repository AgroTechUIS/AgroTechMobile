import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GestionPersonalPage extends ConsumerWidget {
  const GestionPersonalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateActivities = ref.watch(activitiesController);
    return Scaffold(
      backgroundColor: colors.backgroundwhite,
      appBar: AppBar(
        title: const Text('Informe Agro Tech'),
        centerTitle: true,
        backgroundColor: colors.appbar,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background-page.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            const HeaderPageWidget('Mis actividades'),
            SectionScrollWidget(
              children: stateActivities.actividades.map((actividad) {
                return CustomCardWidget(
                  title: '${actividad.nombre}  -  N°${actividad.id}',
                  subtitle: '${actividad.finca} - ${actividad.zona}',
                  content: [
                    'Fecha: ${actividad.fecha}',
                    'estado: ${actividad.estado}',
                  ],
                  imagenUrl: 'assets/images/imagen5.jpg',
                  onPressed: () {},
                  buttonText: 'Actualizar   ✓',
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
