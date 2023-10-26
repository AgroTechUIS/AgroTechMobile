import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/common_utilities/widgets/text_in_line_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/new_activity_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/worker_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/1.1.asignacion_cultivos/widgets/type_activity.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CrearActividadView extends ConsumerWidget {
  CrearActividadView({
    super.key,
  });

  final selectedOption = StateProvider<String>((ref) => '');
  final selectedWorker = StateProvider<int>((ref) => -1);

  final TextEditingController paragraphController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedState = ref.watch(selectedOption);
    var selectedController = ref.read(selectedOption.notifier);
    var selectedWorkerS = ref.watch(selectedWorker);
    var selectedWorkerC = ref.read(selectedWorker.notifier);
    var obreros = ref.watch(listObreros);

    return obreros.when(
      data: (data) {
        List<WorkerModel> listObr = data.response;
        return Scaffold(
          backgroundColor: colors.backgroundwhite,
          appBar: AppBar(
            title: const Text('Agro Tech'),
            centerTitle: true,
            backgroundColor: colors.appbar,
          ),
          body: BackgroundBodyWidget(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const HeaderPageWidget('Crear nueva actividad'),
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
                                'Cultivo asignado:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Text(
                                'id: 123',
                              ),
                            ],
                          ),
                          const Divider(
                            height: 20,
                          ),
                          const TextInLineWidget('Tipo de actividad:'),
                          OptionsAvtivity(
                            selectedState: selectedState,
                            selectedController: selectedController,
                          ),
                          const SizedBox(height: 20),
                          const TextInLineWidget('Descripcion (opcional):'),
                          const SizedBox(height: 10),
                          TextField(
                            controller: paragraphController,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Escribe mas detalles aquí',
                            ),
                          ),
                          const SizedBox(height: 10),
                          const TextInLineWidget('Responsable de la actividad (Opcional):'),
                          const SizedBox(height: 10),
                          SelectObreroWidget(
                              listObr: listObr, selectedWorkerS: selectedWorkerS, selectedWorkerC: selectedWorkerC),
                          const SizedBox(height: 20),
                          const TextInLineWidget('Costo aproximado para esta actividad:'),
                          const SizedBox(height: 10),
                          TextField(
                            controller: valueController,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Escribe el costo aquí',
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => newActivity(
                              context,
                              ref,
                            ),
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
      },
      error: (error, stackTrace) => const ErrorScreen(),
      loading: () => const LoadingListWidget(),
    );
  }

  newActivity(BuildContext context, WidgetRef ref) async {
    final supervisorC = ref.read(supervisorController.notifier);
    var selectedS = ref.watch(selectedOption);
    var selectedWorkerS = ref.watch(selectedWorker);

    var res = await supervisorC.newActivity(NewActivityModel(
      nombre: selectedS,
      descripcion: paragraphController.text,
      idUsuario: selectedWorkerS.toString(),
      costo: valueController.text,
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

class SelectObreroWidget extends StatelessWidget {
  const SelectObreroWidget({
    super.key,
    required this.listObr,
    required this.selectedWorkerS,
    required this.selectedWorkerC,
  });

  final List<WorkerModel> listObr;
  final int selectedWorkerS;
  final StateController<int> selectedWorkerC;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.rp(300),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CartaPersonal(
              name: 'Sin asignar',
              cedula: '',
              selected: -1 == selectedWorkerS,
              onTap: () => selectedWorkerC.update((state) => -1),
            ),
            for (int i = 0; i < listObr.length; i++)
              CartaPersonal(
                name: '${listObr[i].nombre} ${listObr[i].apellido}',
                cedula: 'CC ${listObr[i].cedula}',
                selected: i == selectedWorkerS,
                onTap: () => selectedWorkerC.update((state) => i),
              ),
          ],
        ),
      ),
    );
  }
}

class CartaPersonal extends StatelessWidget {
  const CartaPersonal({
    super.key,
    this.name,
    this.cedula,
    required this.onTap,
    required this.selected,
  });

  final String? name;
  final String? cedula;
  final Function onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          height: context.rp(100),
          width: context.rp(100),
          decoration: BoxDecoration(
            color: selected ? colors.infoBox : colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: colors.infoBox),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/cultivation.svg',
                color: selected ? colors.appbar : colors.appbar,
                height: context.rp(45),
                width: context.rp(45),
              ),
              Text(
                name ?? '',
                style: TextStyle(
                  color: selected ? colors.appbar : colors.black,
                ),
              ),
              Text(
                cedula ?? '',
                style: TextStyle(
                  color: selected ? colors.appbar : colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
