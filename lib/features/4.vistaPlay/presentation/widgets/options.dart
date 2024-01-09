import 'package:agrotech/features/5.plagas/presentation/pest_page.dart';
import 'package:agrotech/features/5.products/presentation/product_controller.dart';
import 'package:agrotech/features/5.variables/presentation/variable_page.dart';
import 'package:agrotech/features/6.medidas/presentation/measure_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_utilities/widgets/mini_option_widget.dart';
import '../../../../common_utilities/widgets/subtitleWidget.dart';
import '../../../5.plagas/presentation/pest_controller.dart';
import '../../../5.variables/presentation/variable_controller.dart';

class VistaPlayOptions extends ConsumerWidget {
  const VistaPlayOptions({
    super.key,
    required this.idCrop,
  });

  final int idCrop;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SubtitleWidget('Opciones sobre el cultivo:'),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MiniOptionWidget(
                    title: 'Plagas',
                    iconRoute: '/pest.svg',
                    onTap: () async {
                      await ref
                          .read(pestController.notifier)
                          .getListPest(idCrop);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlagasPage(idCrop)),
                      );
                    }),
                MiniOptionWidget(
                    title: 'Variables',
                    iconRoute: 'assets/variable.svg',
                    onTap: () async {
                      await ref
                          .read(variableController.notifier)
                          .getListVariable(idCrop);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VariablesPage(
                                  idCrop: idCrop,
                                )),
                      );
                    }),
                MiniOptionWidget(
                    title: 'Medidas',
                    iconRoute: '/medicion.svg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VariablesTPage()),
                      );
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
