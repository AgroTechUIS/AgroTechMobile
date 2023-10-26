import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/2.1.gestion_ingresos/widget/card_ingreso.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GestionEgresos extends ConsumerWidget {
  const GestionEgresos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dataState = ref.watch(gestionEgresos);
    return dataState.when(
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
                    'Gestion Egresos',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SectionScrollWidget(
                  showSearch: false,
                  children: data.facturas!.map((actividad) {
                    return CardIngresoWidget(
                      numeroFactura: actividad.numeroFactura ?? 'Error',
                      valor: actividad.total ?? 0,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => const ErrorScreen(),
      loading: () => const LoadingListWidget(),
    );
  }
}
