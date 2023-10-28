import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_controller.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_state.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/change_state_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class GestionPersonalPage extends ConsumerWidget {
  const GestionPersonalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loadAct = ref.watch(activityObrero);
    var stateActivities = ref.watch(activitiesController);
    var activityController = ref.read(activitiesController.notifier);

    return loadAct.when(
      data: (data) => Scaffold(
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
                  addWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: buttonTapWidget(
                          stateActivities: stateActivities,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: buttonTapWidget(
                          stateActivities: stateActivities,
                        ),
                      ),
                    ],
                  ),
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
                  onSend: (value) => activityController.filterActivities(value),
                ),
              ],
            )),
      ),
      error: (error, stackTrace) => const ErrorScreen(),
      loading: () => const LoadingListWidget(),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2050),
      locale: const Locale('es', 'ES'),
    );
    if (picked != null) {
      print(picked);
    }
  }
}

class buttonTapWidget extends StatelessWidget {
  const buttonTapWidget({
    super.key,
    required this.stateActivities,
  });

  final ActividadesState stateActivities;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.rp(150),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.green3,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Fecha inicio'),
          Text((stateActivities.dateStart ?? DateTime.now()).toString().split(' ').first),
        ],
      ),
    );
  }
}

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: colors.appbar,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const HeaderPageWidget(''),
          SectionScrollWidget(
            showSearch: false,
            children: [
              LoadingBoxWidget(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 60,
                ),
              ),
              LoadingBoxWidget(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 170,
                ),
              ),
              LoadingBoxWidget(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 170,
                ),
              ),
              LoadingBoxWidget(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 170,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingBoxWidget extends StatelessWidget {
  final Widget child;

  const LoadingBoxWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(230, 230, 230, 1), // Color de fondo
      highlightColor: const Color.fromRGBO(210, 210, 210, 1), // Color de destello
      child: child,
    );
  }
}
