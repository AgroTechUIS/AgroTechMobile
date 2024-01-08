import 'package:agrotech/features/5.products/presentation/product_state.dart';
import 'package:agrotech/features/5.products/presentation/widgets/edit_product.dart';
import 'package:agrotech/features/5.products/presentation/widgets/new_product.dart';
import 'package:agrotech/features/5.products/presentation/widgets/product_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../data/network/product_repository_impl.dart';
import '../data/network/product_service.dart';
import '../domain/models/product_response_model.dart';
import '../domain/use_cases/get_product_use_case_impl.dart';
import 'product_controller.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class ProductPage extends ConsumerWidget {
  final ccase = GetProductUseCaseImpl(ProductRepositoryImpl(ProductService()));

  void deleteProduct(
      ProductResponseModel producto, ProductController controller) {
    controller.deleteProduct(producto);
    controller.updateProduct(producto);
    Fluttertoast.showToast(
      msg: 'Producto eliminado correctamente.',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: const Color.fromARGB(255, 34, 95, 36), // Fondo rojo
      textColor: Colors.white,
    );
  }

  void createNewProduct(BuildContext context, ProductController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return NewProduct(
          onSave: (nuevoProducto) {
            bool existeProducto =
                controller.existeProductoConNombre(nuevoProducto.name!);

            if (existeProducto) {
              Fluttertoast.showToast(
                msg: 'Ya existe un producto con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              controller.saveProducts(nuevoProducto);
              Fluttertoast.showToast(
                msg: 'Producto creado correctamente.',
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

  void editProduct(context, ProductResponseModel producto,
      ProductController controller, ProductState state) {
    state.selectedProductForEdit = producto;
    showDialog(
      context: context,
      builder: (context) {
        return EditProduct(
          initialProduct: state.selectedProductForEdit,
          onSave: (nc) async {
            final nca = await controller.updatesProducts(nc, producto);

            ProductResponseModel productModel =
                ProductResponseModel.fromJson(nca);
            bool existeProducto = controller.existeProductoEConNombre(
                productModel.name!, productModel);

            if (existeProducto) {
              Fluttertoast.showToast(
                msg: 'Ya existe un Producto con el mismo nombre.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP_RIGHT,
                backgroundColor: Colors.red, // Fondo rojo
                textColor: Colors.white,
              );
            } else {
              // controller.getListProduct();
              Fluttertoast.showToast(
                msg: 'Producto actualizado correctamente.',
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
    var state = ref.watch(productController);
    var controller = ref.read(productController.notifier);
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewProduct(context, controller),
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
                    'Productos',
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
                children: state.productos
                    .map((e) => ProductWidget(
                          producto: e,
                          onEdit: () {
                            editProduct(context, e, controller, state);
                          },
                          onDelete: () {
                            deleteProduct(e, controller);
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
