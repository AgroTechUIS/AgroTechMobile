
/*import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCameraGallery extends StatefulWidget {
  @override
  State<ImageCameraGallery> createState() => _ImageCameraGalleryState();
}

class _ImageCameraGalleryState extends State<ImageCameraGallery> {
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No has seleccionado imagenes');
  }

  // ignore: unused_field
  Uint8List? _image;

  selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 150,
        alignment: Alignment(0, -100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.teal),
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                side: const BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
                backgroundColor: Colors.transparent,
                primary: Colors.black,
                onSurface: Colors.black,
              ),
              onPressed: () {
                // Acción a realizar cuando se presiona el botón
              },
              child: const Text(
                'Camara',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.transparent,
                  primary: Colors.black,
                  onSurface: Colors.black,
                ),
                onPressed: () {
                  selectImage();
                },
                child: const Text(
                  'Galeria',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        )),
      ),
    );
  }
}*/
