import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_controller.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/data_activity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeStatusScreen extends ConsumerWidget {
  ChangeStatusScreen({
    super.key,
    required this.actividad,
  });

  final selectedOption = StateProvider<String>((ref) => 'Pendiente');
  final TextEditingController paragraphController = TextEditingController();
  final ActivityModel actividad;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedState = ref.watch(selectedOption);
    var selectedController = ref.read(selectedOption.notifier);
    //var obreroController = ref.read(activitiesController.notifier);

    return Scaffold(
      backgroundColor: colors.backgroundwhite,
      appBar: AppBar(
        title: const Text('Agro Tech'),
        centerTitle: true,
        backgroundColor: colors.appbar,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background-page.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              const HeaderPageWidget('Actualizar actividad'),
              SectionWidget(
                children: [
                  const SubtitleWidget('Agrotech:'),
                  SectionWidget(
                    padding: 20,
                    background: colors.white,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Datos:',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      DataActivity(actividad: actividad),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text(
                            'Selecciona un estado:',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        child: RadioListTile(
                          title: const Text('Pendiente'),
                          value: 'Pendiente',
                          activeColor: colors.green3,
                          groupValue: selectedState,
                          onChanged: (value) {
                            selectedController.update((state) => value ?? state);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: RadioListTile(
                          title: const Text('Realizando'),
                          value: 'Realizando',
                          activeColor: colors.green3,
                          groupValue: selectedState,
                          onChanged: (value) {
                            selectedController.update((state) => value ?? state);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: RadioListTile(
                          title: const Text('Completado'),
                          value: 'Completado',
                          activeColor: colors.green3,
                          groupValue: selectedState,
                          onChanged: (value) {
                            selectedController.update((state) => value ?? state);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Text(
                            'Observaciones:',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: paragraphController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Escribe tus observaciones aquí',
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => update(context, ref, selectedState),
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  update(BuildContext context, WidgetRef ref, String selectedState) async {
    final obreroController = ref.read(activitiesController.notifier);

    bool res = await obreroController.updateActivities(UpdateActivityModel(
      idActividad: actividad.id,
      estado: selectedState,
      descripcion: paragraphController.text,
    ));
    if (res) {
      Navigator.pop(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ErrorScreen()),
      );
    }
  }
}
