import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../domain/models/crop_model.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class CropPage extends StatefulWidget {
  const CropPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CropPageState createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: null, //createNewPest,
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
                    'CULTIVOS',
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
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  //await getAllPestByCrop();
                  setState(() {});
                },
                child: Text('Hola'),

                /*child: ListView(
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
                ),*/
              ),
            ),
          ),
        ],
      ),
    );
  }
}
