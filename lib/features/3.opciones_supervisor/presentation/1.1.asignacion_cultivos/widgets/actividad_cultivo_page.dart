import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/1.1.asignacion_cultivos/widgets/card_activity_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/1.1.asignacion_cultivos/widgets/crear_actividad_view.dart';
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
      body: BackgroundBodyWidget(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const HeaderPageWidget('Administrar actividades'),
            SectionScrollWidget(
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrearActividadView(),
                    ),
                  ), // CrearActividadView(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    constraints: const BoxConstraints(
                      minWidth: 500,
                    ),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Crear Nueva actividad',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add,
                          color: colors.green2,
                        ),
                      ],
                    ),
                  ),
                ),
                ...supervisorState.actividades.map((actividad) {
                  return CardActivityWidget(
                    nombre: actividad.nombre ?? 'Error',
                    obrero: actividad.obrero ?? 'Error',
                    estado: actividad.estado ?? 'Error',
                  );
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
