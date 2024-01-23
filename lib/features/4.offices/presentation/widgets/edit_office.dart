import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common_utilities/config/colors_theme.dart';
import '../../../6.medidas/presentation/widgets/my_buttom.dart';
import '../../domain/models/office_model.dart';

class EditOffice extends StatefulWidget {
  void Function(OfficeModel)? onSave;
  VoidCallback? onCancel;
  OfficeModel? initialOffice;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phbneController = TextEditingController();

  EditOffice({
    super.key,
    this.onSave,
    this.onCancel,
    required this.initialOffice,
  }) {}

  // ignore: empty_constructor_bodies
  @override
  _editOfficeState createState() => _editOfficeState();
}

class _editOfficeState extends State<EditOffice> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("¿El cliente ya tiene su pedido?"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 12,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    text: "Sí",
                    onPressed: () {
                      OfficeModel nuevoDescuento = OfficeModel(
                          id: widget.initialOffice?.id,
                          status: 'Pedido entregado');

                      widget.onSave!(nuevoDescuento);
                    },
                    color: colors.green2,
                    textColor: colors.white),
                MyButton(
                  text: "No",
                  onPressed: widget.onCancel,
                  color: colors.white,
                  textColor: colors.textColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
