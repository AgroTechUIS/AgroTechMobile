import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/filter_by_date.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_controller.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/change_state_view.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_boxWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GestionPersonalPage extends ConsumerWidget {
  const GestionPersonalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loadState = ref.watch(activityObrero);
    var stateActivities = ref.watch(activitiesController);
    var activityController = ref.read(activitiesController.notifier);

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
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(
            height: 20,
          ),
          const HeaderPageWidget('Mis actividades'),
          SectionScrollWidget(
              addWidget: FilterByDate(
                onSearch: (value) => activityController.filterActivities(value),
                onSelect: (DateTime? d1, DateTime? d2) => activityController.changeDate(d1, d2),
              ),
              children: [
                loadState.when(
                  data: (data) => Column(
                    children: stateActivities.actividadesFiltered.map((actividad) {
                      return CustomCardWidget(
                        title: '${actividad.nombre}  -  N°${actividad.id}',
                        subtitle: '${actividad.finca} - ${actividad.zona}',
                        content: [
                          'Fecha: ${actividad.fecha}',
                          'estado: ${actividad.estado}',
                        ],
                        imagenUrl: 'assets/images/imagen5.jpg',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChangeStatusScreen(actividad: actividad)),
                          );
                        },
                        buttonText: 'Actualizar   ✓',
                      );
                    }).toList(),
                  ),
                  error: (error, stackTrace) => const SizedBox(),
                  loading: () => Column(
                    children: List.generate(3, (index) {
                      return LoadingBoxWidget(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 190,
                        ),
                      );
                    }),
                  ),
                ),
              ]),
        ]),
      ),
    );
  }
}
