// ignore_for_file: use_build_context_synchronously

import 'package:agrotech/common_utilities/widgets/mini_option_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_page.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_page.dart';
import 'package:agrotech/features/5.cuidados/presentation/cuidado_page.dart';
import 'package:agrotech/features/4.products/presentation/product_controller.dart';
import 'package:agrotech/features/4.products/presentation/product_page.dart';
import 'package:agrotech/features/4.shippings/presentation/shippings_controller.dart';
import 'package:agrotech/features/4.shippings/presentation/shippings_page.dart';
import 'package:agrotech/features/6.tratamientos/presentation/treatment_page.dart';
import 'package:agrotech/features/5.variables/presentation/variable_page.dart';
import 'package:agrotech/features/6.medidas/presentation/measure_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../1.login/presentation/login_controller.dart';
import '../../../4.cultivos/presentation/crop_controller.dart';

class GestorOptions extends ConsumerWidget {
  const GestorOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateLogin = ref.watch(loginController);
    var controller = ref.read(cropController.notifier);

    var controller2 = ref.read(productController.notifier);
    var controller3 = ref.read(shippingController.notifier);

    return Column(
      children: [
        const SubtitleWidget('Mis actividades:'),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MiniOptionWidget(
                  title: 'Gestión agrícola',
                  iconRoute: 'assets/agronomy.svg',
                  onTap: () async {
                    await controller.getListCrop(stateLogin.idEmpresa);
                    await controller.getListPlants();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CropPage()),
                    );
                  },
                ),
                MiniOptionWidget(
                  title: 'Gestión de productos',
                  iconRoute: 'assets/bill.svg',
                  onTap: () async {
                    await controller2.getListProduct(stateLogin.idEmpresa);
                    await controller2.getListCategories();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductPage(idEmpresa: stateLogin.idEmpresa)),
                    );
                  },
                ),
                MiniOptionWidget(
                  title: 'Gestión de envios',
                  iconRoute: '/envios.svg',
                  onTap: () async {
                    await controller3.getListShipping(stateLogin.idEmpresa);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ShippingsPage(idEmpresa: stateLogin.idEmpresa)),
                    );
                  },
                ),
                /* MiniOptionWidget(
                  title: 'Tratamientos',
                  iconRoute: 'assets/agronomy.svg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TratamientosPage()),
                    )
                  },
                  //goPage: TratamientosPage(),
                ),
                MiniOptionWidget(
                  title: 'Variables',
                  iconRoute: 'assets/agronomy.svg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VariablesPage()),
                    );
                  },
                  //goPage: VariablesPage(),
                ),
                MiniOptionWidget(
                  title: 'Cuidados',
                  iconRoute: 'assets/agronomy.svg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CuidadosPage()),
                    );
                  },
                  //goPage: CuidadosPage(),
                ),
                MiniOptionWidget(
                  title: 'Medidas',
                  iconRoute: 'assets/agronomy.svg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VariablesTPage()),
                    );
                  },
                  //goPage: VariablesTPage(),
                ),;*/
              ],
            ),
          ),
        ),
      ],
    );
  }
}
