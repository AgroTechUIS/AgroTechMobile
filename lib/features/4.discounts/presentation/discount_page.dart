import 'package:agrotech/features/4.discounts/domain/models/discount_model.dart';
import 'package:agrotech/features/4.discounts/presentation/widgets/discount_widgets.dart';
import 'package:agrotech/features/4.discounts/presentation/widgets/edit_discount.dart';
import 'package:agrotech/features/4.discounts/presentation/widgets/new_discount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';
import 'discount_controller.dart';
import 'discount_state.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class DiscountPage extends ConsumerWidget {
  DiscountPage({super.key, required this.idEmpresa});

  final int idEmpresa;

  void deleteDiscount(DiscountModel descuento, DiscountController controller) {
    controller.deleteDiscount(descuento);
    controller.updateDiscount(descuento);
    Fluttertoast.showToast(
      msg: 'Descuento eliminado correctamente.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
      textColor: Colors.white,
    );
  }

  void createNewDiscount(BuildContext context, DiscountController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return NewDiscount(
          onSave: (nuevoDescuento) async {
            bool existeDescuento =
                controller.existeDescuento(nuevoDescuento.discount!);

            if (existeDescuento) {
              Fluttertoast.showToast(
                msg: 'Ya existe un descuento con el mismo valor.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.saveDiscounts(nuevoDescuento, idEmpresa);
              Future.delayed(const Duration(milliseconds: 500));
              await controller.getListDiscount(idEmpresa);

              Fluttertoast.showToast(
                msg: 'Descuento creado correctamente.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor:
                    const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
                textColor: Colors.white,
              );
              Navigator.of(context).pop();
            }
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void editDiscount(context, DiscountModel descuento,
      DiscountController controller, DiscountState state) {
    state.selectedDiscountForEdit = descuento;
    showDialog(
      context: context,
      builder: (context) {
        return EditDiscount(
          initialDiscount: state.selectedDiscountForEdit,
          onSave: (nc) async {
            final nca = await controller.updatesDiscounts(nc, descuento);

            DiscountModel discountModel = DiscountModel.fromJson(nca);
            bool existeDescuento = controller.existeDescuentoE(
                discountModel.discount!, discountModel);

            if (existeDescuento) {
              Fluttertoast.showToast(
                msg: 'Ya existe un descuento con el mismo valor.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.getListDiscount(idEmpresa);
              Fluttertoast.showToast(
                msg: 'Descuento actualizado correctamente.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor:
                    const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
                textColor: Colors.white,
              );
              Navigator.of(context).pop();
            }
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(discountController);
    var controller = ref.read(discountController.notifier);
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewDiscount(context, controller),
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Descuentos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                children: state.descuentos
                    .map((e) => DiscountWidget(
                          descuento: e,
                          onEdit: () {
                            editDiscount(context, e, controller, state);
                          },
                          onDelete: () {
                            deleteDiscount(e, controller);
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
