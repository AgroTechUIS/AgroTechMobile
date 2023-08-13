import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';

import '../../domain/models/plagas_model.dart';
import 'my_buttom.dart';  


class NewPest extends StatefulWidget {
  void Function(Plaga)? onSave;
  VoidCallback? onCancel;
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController observacionesController = TextEditingController();
  final TextEditingController familiaController = TextEditingController();
  
  NewPest({super.key,  this.onSave,  this.onCancel});
  @override
  _NewPestState createState() => _NewPestState();

  }
class _NewPestState extends State<NewPest> {

  final List<String> items = [
  'Baja precencia',
  'Precencia moderada',
  'Alta precencia',
  'Controlada',
];
String? selectedValue;
  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Crea una nueva plaga"),

      content: SingleChildScrollView(
     child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () async{
                //image
              },
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: widget.nombreController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Nombre "),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),

            ),
            SizedBox(height: 12),
            TextField(
              controller: widget.descripcionController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text("Descripcion "),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )
                  
                  ),
                  child:       DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          
          hint: Text(
            'Estado de la plaga',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 20,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
                  ),
                  
            ),
            SizedBox(height: 12),
            TextField(
              controller: widget.observacionesController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Observaciones"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: widget.familiaController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: const Text("Familia de la plaga"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),

             Divider(),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
                MyButton(text: "Guardar",onPressed: 
                (){
                Plaga nuevaPlaga = Plaga(
                id: 0, // Asigna el ID adecuado
                name: widget.nombreController.text,
                description: widget.descripcionController.text,
                state: selectedValue,
                observation: widget.observacionesController.text,
                pestFamily: widget.familiaController.text,
              );
              widget.onSave!(nuevaPlaga);
                }
                ,color: colors.green2,textColor: colors.white),
                MyButton(text: "Cerrar",onPressed: widget.onCancel,color: colors.white,textColor: colors.textColor),
              ],
             )
          ],
        ),
      ),

    );
  }
}