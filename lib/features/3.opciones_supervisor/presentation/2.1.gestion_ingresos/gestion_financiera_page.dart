import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/2.1.gestion_ingresos/widget/card_ingreso.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GestionIngresos extends ConsumerWidget {
  const GestionIngresos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var supervisorState = ref.watch(supervisorController);
    var dataState = ref.watch(fetchDataFutureProvider);
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
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Gestion Ingresos',
                style: TextStyle(fontSize: 25),
              ),
            ),
            dataState.when(
              data: (data) => SectionScrollWidget(
                showSearch: false,
                children: data.facturas!.map((actividad) {
                  return CardIngresoWidget(
                    numeroFactura: actividad.numeroFactura ?? 'Error',
                    valor: actividad.total ?? 0,
                  );
                }).toList(),
              ),
              loading: () => SizedBox(),
              error: (error, stackTrace) => SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
