import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/error_screen.dart';
import 'package:agrotech/common_utilities/widgets/filter_by_date.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_boxWidget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/2.1.gestion_ingresos/widget/card_ingreso.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/supervisor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GestionEgresos extends ConsumerWidget {
  const GestionEgresos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loadState = ref.watch(gestionEgresos);
    var controller = ref.read(supervisorController.notifier);
    var state = ref.watch(supervisorController);

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
              addWidget: FilterByDate(
                onSelect: (DateTime? d1, DateTime? d2) => controller.filterExpensebyDate(d1, d2),
              ),
              children: [
                loadState.when(
                  data: (data) {
                    return Column(
                      children: state.filterEgresos.map((actividad) {
                        return CardMovementWidget(
                          numeroFactura: '${actividad.id ?? 0}',
                          valor: actividad.total ?? 0,
                        );
                      }).toList(),
                    );
                  },
                  error: (error, stackTrace) => ErrorScreen(connectionError: error.toString()),
                  loading: () => Column(
                    children: List.generate(
                      10,
                      (index) => LoadingBoxWidget(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 80,
                        ),
                      ),
                    ),
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
