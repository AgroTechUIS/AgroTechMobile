import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/filter_by_text_date_widget.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_boxWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/1.1.asignacion_cultivos/widgets/card_activity_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/1.1.asignacion_cultivos/widgets/crear_actividad_view.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActCultivoPage extends ConsumerWidget {
  const ActCultivoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(supervisorController.notifier);
    var state = ref.watch(supervisorController);
    var loadState = ref.watch(cropActController);

    if (loadState.hasError) {
      return ErrorScreen(connectionError: loadState.asError.toString());
    }

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
              addWidget: FilterByTextDateWidget(
                onSearch: (d1, d2, value) => controller.filterActivitiesByTextAndDate(d1, d2, value),
              ),
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrearActividadView(),
                    ),
                  ),
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
                loadState.when(
                  data: (data) => Column(
                    children: state.filterActivities.map((actividad) {
                      return CardActivityWidget(
                        nombre: actividad.nombre ?? 'Error',
                        obrero: actividad.obrero ?? 'Error',
                        estado: actividad.estado ?? 'Error',
                      );
                    }).toList(),
                  ),
                  error: (error, stackTrace) => const SizedBox(),
                  loading: () => Column(
                    children: List.generate(7, (index) {
                      return LoadingBoxWidget(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 160,
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
