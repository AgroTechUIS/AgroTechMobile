import 'package:agrotech/features/1.login/presentation/login_page.dart';
import 'package:agrotech/features/5.cuidados/presentation/cuidado_controller.dart';
import 'package:agrotech/features/5.cuidados/presentation/cuidado_page.dart';
import 'package:agrotech/features/5.plagas/presentation/pest_page.dart';
import 'package:agrotech/features/4.products/presentation/product_page.dart';
import 'package:agrotech/features/5.variables/presentation/variable_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_utilities/widgets/mini_option_widget.dart';
import '../../../../common_utilities/widgets/subtitleWidget.dart';
import '../../../5.plagas/presentation/pest_controller.dart';
import '../../../5.variables/presentation/variable_controller.dart';

class VistaEmpresaOptions extends ConsumerWidget {
  const VistaEmpresaOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SubtitleWidget('Opciones sobre la cuenta:'),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MiniOptionWidget(
                    title: 'Empresa',
                    iconRoute: '/pest.svg',
                    onTap: () async {
                      await ref.read(pestController.notifier);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
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
