import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/config/colors_theme.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/section_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/subtitleWidget.dart';
import 'package:agrotech/home/presentation/widgets/capataz_options_widget.dart';
import 'package:agrotech/home/presentation/widgets/financiero_options_wideget.dart';
import 'package:agrotech/home/presentation/widgets/obreros_options_widget.dart';
import 'package:agrotech/home/presentation/widgets/text_item_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    //required this.rol,
  });

  //final UserRol rol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundwhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Agro Tech',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: colors.appbar,
        elevation: 0,
      ),
      body: Stack(
        children: [
          BackgroundBodyWidget(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
              ),
              dragStartBehavior: DragStartBehavior.start,
              reverse: false,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SectionWidget(children: [
                    const SubtitleWidget('Mis datos:'),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      foregroundColor: colors.infoBox,
                                      backgroundImage:
                                          const NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135768.png'),
                                    ),
                                    Expanded(
                                      child: SectionWidget(
                                        background: colors.appbar,
                                        children: [
                                          Text(
                                            'Id: 12345',
                                            style: TextStyle(fontSize: 25, color: colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const TextItemWidget(title: 'Nombre:', text: 'Sergio Andres Sánchez Niño'),
                                const TextItemWidget(title: 'Cedula:', text: '1098816863'),
                                const TextItemWidget(title: 'Correo:', text: 'financiero@agrotech.com'),
                                const TextItemWidget(title: 'Teléfono:', text: '30000000'),
                                const TextItemWidget(title: 'Cargo:', text: 'Gestor financiero'),
                                const TextItemWidget(title: 'Rol:', text: 'Financiero'),
                                const TextItemWidget(title: 'Ingreso:', text: '19/702020'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SectionWidget(
                    children: [
                      const SubtitleWidget('Agrotech:'),
                      SectionWidget(
                        background: colors.white,
                        children: const [
                          FinancieroOptions(),
                          CapatazOptions(),
                          ObreroOptions(),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
              color: colors.appbar,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.elliptical(400, 60),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum UserRol {
  financiero,
  capataz,
  obrero,
  lock,
}
