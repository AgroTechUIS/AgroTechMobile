// ignore_for_file: use_build_context_synchronously

import 'package:agrotech/common_utilities/widgets/mini_option_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/actividades_page.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_page.dart';
import 'package:agrotech/features/4.discounts/presentation/discount_controller.dart';
import 'package:agrotech/features/4.discounts/presentation/discount_page.dart';
import 'package:agrotech/features/4.orders/presentation/order_controller.dart';
import 'package:agrotech/features/4.orders/presentation/order_page.dart';
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
    var controller4 = ref.read(discountController.notifier);
    var controller5 = ref.read(orderController.notifier);
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
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MiniOptionWidget(
                  title: 'Gestión de productos',
                  iconRoute: 'assets/bill.svg',
                  onTap: () async {
                    await controller2.getListProduct(stateLogin.idEmpresa);
                    await controller2.getListCategories();
                    await controller2.getListDiscounts(stateLogin.idEmpresa);
                    await controller2.getListCrops(stateLogin.idEmpresa);

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
                MiniOptionWidget(
                  title: 'Gestión de descuentos',
                  iconRoute: '/discount.svg',
                  onTap: () async {
                    await controller4.getListDiscount(stateLogin.idEmpresa);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DiscountPage(idEmpresa: stateLogin.idEmpresa)),
                    );
                  },
                ),
                MiniOptionWidget(
                  title: 'Gestión de pedidos',
                  iconRoute: '/orders.svg',
                  onTap: () async {
                    await controller5.getListOrder(stateLogin.idEmpresa);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderPage(
                                idEmpresa: stateLogin.idEmpresa,
                              )),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
