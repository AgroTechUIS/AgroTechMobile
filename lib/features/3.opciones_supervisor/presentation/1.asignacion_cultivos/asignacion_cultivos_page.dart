import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/1.asignacion_cultivos/widgets/actividad_cultivo_page.dart';
import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsigCultivoPage extends ConsumerWidget {
  const AsigCultivoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var supervisorState = ref.watch(supervisorController);
    var supervisorControllerIns = ref.read(supervisorController.notifier);
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
              children: supervisorState.cultivos.map((cultivo) {
                return CustomCardWidget(
                  title: 'Cultivo de ${cultivo.planta}\nN°${cultivo.idCultivo}',
                  subtitle: cultivo.finca ?? '',
                  content: [
                    'Direccion: ${cultivo.direccion}',
                    'Zona: ${cultivo.zona}',
                  ],
                  imagenUrl: 'assets/images/imagen5.jpg',
                  onPressed: () {
                    supervisorControllerIns.loadActivitiesCrop(cropModel: cultivo);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActCultivoPage()),
                    );
                  },
                  buttonText: 'Administrar Actividades',
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
