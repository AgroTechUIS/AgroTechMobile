import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/filter_by_date.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_boxWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/3.4.informe_cultivos/statistics_cultivo_page.dart';
import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeCultivosPage extends ConsumerWidget {
  const InformeCultivosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loadState = ref.watch(asignacionCultivos);
    var state = ref.watch(supervisorController);
    var controller = ref.read(supervisorController.notifier);

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
            const HeaderPageWidget('Informe cultivos'),
            SectionScrollWidget(
              addWidget: FilterByDate(
                onSearch: (value) => controller.filterCrops(value),
              ),
              children: [
                loadState.when(
                  data: (data) => Column(
                    children: state.filterCultivos.map((cultivo) {
                      return CustomCardWidget(
                        title: 'Cultivo de ${cultivo.planta}\nN°${cultivo.idCultivo}',
                        subtitle: cultivo.finca ?? '',
                        content: [
                          'Direccion: ${cultivo.direccion}',
                          'Zona: ${cultivo.zona}',
                        ],
                        imagenUrl: 'assets/images/imagen5.jpg',
                        onPressed: () {
                          controller.updateSelectCrop(cultivo);
                          Future.delayed(const Duration(milliseconds: 10));
                          context.pushRoute(StadisticCultivoPage(idCultivo: cultivo.idCultivo.toString()));
                        },
                      );
                    }).toList(),
                  ),
                  error: (error, stackTrace) => const SizedBox(),
                  loading: () => Column(
                    children: List.generate(3, (index) {
                      return LoadingBoxWidget(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 190,
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
