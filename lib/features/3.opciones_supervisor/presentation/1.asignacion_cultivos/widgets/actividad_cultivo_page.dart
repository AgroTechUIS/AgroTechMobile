import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/1.asignacion_cultivos/widgets/card_activity_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActCultivoPage extends ConsumerWidget {
  const ActCultivoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var supervisorState = ref.watch(supervisorController);

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
            const HeaderPageWidget('Administrar actividades'),
            SectionScrollWidget(
              showSearch: false,
              children: supervisorState.actividades.map((actividad) {
                return CardActivityWidget(
                  nombre: actividad.nombre ?? 'Error',
                  obrero: actividad.obrero ?? 'Error',
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
