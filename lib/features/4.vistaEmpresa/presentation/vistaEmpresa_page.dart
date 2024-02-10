import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/features/4.cultivos/presentation/crop_page.dart';
import 'package:agrotech/features/4.vistaEmpresa/presentation/widgets/options.dart';
import 'package:agrotech/features/4.vistaPlay/presentation/widgets/options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_utilities/config/colors_theme.dart';
import '../../../common_utilities/widgets/background_body_widget.dart';
import '../../../common_utilities/widgets/section_widget.dart';
import '../../../common_utilities/widgets/subtitleWidget.dart';

class VistaPlayPage extends ConsumerWidget {
  const VistaPlayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          BackgroundBodyWidget(child: Column()),
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
            ),
            dragStartBehavior: DragStartBehavior.start,
            reverse: false,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SectionWidget(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  children: [
                    const SubtitleWidget('OPCIONES:'),
                    SectionWidget(
                      background: colors.white,
                      children: [
                        VistaEmpresaOptions(),
                      ],
                    ),
                  ],
                ),
                SectionWidget(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  children: [
                    InkWell(
                      onTap: () => context.remplaceRoute(CropPage()),
                      child: SectionWidget(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        background: colors.white,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SubtitleWidget('Volver'),
                              Icon(Icons.logout_outlined),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
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
