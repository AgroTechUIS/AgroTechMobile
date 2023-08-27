import 'dart:convert';

import 'package:agrotech/config/theme_provider.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/section_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/plagas/presentation/providers/plagas_provider.dart';
import 'package:agrotech/plagas/domain/models/plagas_model.dart';
import 'package:agrotech/plagas/presentation/widgets/edit_pest.dart';
import 'package:agrotech/plagas/presentation/widgets/new_pest.dart';
import 'package:agrotech/plagas/presentation/widgets/pest_widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class PlagasPage extends StatefulWidget {
  const PlagasPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlagasPageState createState() => _PlagasPageState();
}

class _PlagasPageState extends State<PlagasPage> {
  List<Plaga> listPest = [];
  Plaga? selectedPlagaForEdit;

  late Future<List<Plaga>> _listadoPlagas;

  Future<Uint8List> _getImageBytes(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception("Error al obtener los bytes de la imagen");
    }
  }

  Future<void> _getPlagas() async {
    try {
      final response =
          await http.get(Uri.parse("http://3.81.168.53:8080/api/pest/1"));
      List<Plaga> lPlagas = [];

      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(body);

        for (var item in jsonData) {
          final adjuntoDto = item["adjuntoDto"];

          if (adjuntoDto != null) {
            final imageUrl = adjuntoDto["url"];
            final imageBytes = await _getImageBytes(imageUrl);

            lPlagas.add(Plaga(
                id: item["id"],
                name: item["name"],
                description: item["description"],
                state: item["state"],
                observation: item["observation"],
                appareceDate: DateTime.parse(item["appareceDate"]),
                pestFamily: item["pestFamily"],
                state_tratment: item["state_tratment"],
                crop: item["crop"],
                image: imageBytes));
          } else {
            lPlagas.add(Plaga(
                id: item["id"],
                name: item["name"],
                description: item["description"],
                state: item["state"],
                observation: item["observation"],
                appareceDate: DateTime.parse(item["appareceDate"]),
                pestFamily: item["pestFamily"],
                state_tratment: item["state_tratment"],
                crop: item["crop"],
                image: null)); // Opcionalmente asignar null si no hay imagen
          }
        }
      } else {
        throw Exception("Falló la conexión (get)");
      }
    } catch (e) {
      // Manejar la excepción
      print("Ocurrió un error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _getPlagas();
  }

  void saveNewPest(Plaga plaga) {
    setState(() {
      listPest.add(plaga);
    });
  }

  void editPest(Plaga plaga) {
    selectedPlagaForEdit = plaga;
    showDialog(
      context: context,
      builder: (context) {
        return EditPest(
          initialPlaga: selectedPlagaForEdit,
          onSave: (EditPest) {
            // Actualizar la lista de plagas
            setState(() {
              listPest.remove(selectedPlagaForEdit);
              listPest.add(EditPest);
            });
            Navigator.of(context).pop();
          },
          onCancel: () {
            selectedPlagaForEdit =
                null; // Limpiar la variable temporal si se cancela
            Navigator.of(context).pop();
          },
          // Inicializa los controladores y otros campos con los valores de 'selectedPlagaForEdit'
        );
      },
    );
  }

  void deletePest(Plaga plaga) {
    setState(() {
      listPest.remove(plaga);
    });
  }

  void createNewPest() {
    showDialog(
      context: context,
      builder: (context) {
        return NewPest(
          onSave: (nuevaPlaga) {
            saveNewPest(nuevaPlaga);
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewPest,
        child: Icon(Icons.add),
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
                    'Plagas y Enfermedades',
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
                children: listPest
                    .map((e) => PestWidget(
                          plaga: e,
                          onEdit: () {
                            editPest(e);
                          },
                          onDelete: () {
                            deletePest(e);
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
