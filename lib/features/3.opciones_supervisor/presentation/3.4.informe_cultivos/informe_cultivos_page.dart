import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
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
    var state = ref.watch(asignacionCultivos);
    return state.when(
      data: (data) {
        if ((data.error ?? '').isNotEmpty) {
          return const ErrorScreen();
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
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Informe cultivos',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SectionScrollWidget(
                  children: data.cultivos!.map((cultivo) {
                    return CustomCardWidget(
                      title: 'Cultivo de ${cultivo.planta}',
                      subtitle: '${cultivo.finca}',
                      content: [
                        'Direccion: ${cultivo.direccion}',
                        'Zona: ${cultivo.zona}',
                        'Id: ${cultivo.idCultivo}',
                        'Fecha inicio: ${cultivo.fechaInicio}',
                        'Fecha fin: ${cultivo.fechaFin}'
                      ],
                      imagenUrl: 'assets/images/imagen6.jpg',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StadisticCultivoPage(idCultivo: '${cultivo.idCultivo}')),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
