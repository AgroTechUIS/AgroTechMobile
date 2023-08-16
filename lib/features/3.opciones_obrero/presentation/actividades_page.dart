import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/header_page_widget.dart';
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              netImages.background,
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
            const HeaderPageWidget('Gestion Personal'),
            SectionScrollWidget(
              children: stateActivities.actividades.map((actividad) {
                return CustomCardWidget(
                  title: '${actividad.nombre}  -  N°${actividad.id}',
                  subtitle: '${actividad.finca} - ${actividad.zona}',
                  content: [
                    'Fecha: ${actividad.fecha}',
                    'estado: ${actividad.estado}',
                  ],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/harvesting-wheat-tranquil-meadow-sunset-generated-by-ai_24640-80628.jpg?w=996&t=st=1686979963~exp=1686980563~hmac=3d6b93340bb888fa767ef198b2a3fe0d9c04477822c49ff0c12de8d7307abff8',
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
