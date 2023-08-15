import 'dart:typed_data';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/models/plagas_model.dart';

class PestWidget extends StatelessWidget {
  final Plaga plaga;
  final VoidCallback onEdit; // Agrega este parámetro
  final VoidCallback onDelete; // Agrega este parámetro
  PestWidget(
      {required this.plaga, required this.onEdit, required this.onDelete});

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      return await file.readAsBytes();
    }
    print('No has seleccionado imagenes');
  }

  Uint8List? image;
  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    image = img;
    plaga.image = image;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Elevación de la tarjeta
      margin: EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 1.0), // Margen de la tarjeta
      shape: RoundedRectangleBorder(
        // Agrega el radio de borde
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Nombre: ',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 2.0), // Agrega padding arriba
                    child: Text(
                      plaga.name ?? '',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ]),
                Spacer(),
                GestureDetector(
                    onTap: () async {
                      if (plaga.image != null) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text('Imagen'),
                                    content: Container(
                                      width: 200,
                                      height: 230,
                                      child: PhotoView(
                                        imageProvider:
                                            MemoryImage(plaga.image!),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Cerrar el cuadro de diálogo
                                        },
                                        child: Text('Cerrar'),
                                      ),
                                    ]));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                    title: Text('No hay imagen'),
                                    content: Text('SIN IMAGEN'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Cerrar el cuadro de diálogo
                                        },
                                        child: Text('Cerrar'),
                                      ),
                                    ]));
                      }
                    },
                    child: plaga.image != null
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage: MemoryImage(plaga.image!))
                        : CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: Colors.black,
                            ),
                          )),
              ],
            ),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Descripción: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  plaga.description ?? '',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Estado de la plaga: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  plaga.state ?? '',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Observaciones: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  plaga.observation ?? '',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Fecha de aparición: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  '${plaga.appareceDate!.year}-${plaga.appareceDate!.month}-${plaga.appareceDate!.day}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Tratamiento: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  plaga.state_tratment ??
                      'No se ha iniciado ningun tratamiento.',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 8.0), // Espacio entre el nombre y la descripción
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Familia de la plaga: ',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0), // Agrega padding arriba
                child: Text(
                  plaga.pestFamily ?? '',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),

            SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: onEdit,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.edit),
                ),
                SizedBox(width: 8.0),
                FloatingActionButton(
                  onPressed: onDelete,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
