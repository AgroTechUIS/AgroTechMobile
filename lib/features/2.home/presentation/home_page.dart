import 'package:agrotech/common_utilities/context_extension.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:agrotech/common_utilities/widgets/subtitleWidget.dart';
import 'package:agrotech/features/1.login/presentation/login_page.dart';
import 'package:agrotech/features/2.home/presentation/widgets/dni_widget.dart';
import 'package:agrotech/features/2.home/presentation/widgets/gestor_options_widget.dart';
import 'package:agrotech/features/2.home/presentation/widgets/supervisor_options_widget.dart';
import 'package:agrotech/features/2.home/presentation/widgets/obreros_options_widget.dart';
import 'package:agrotech/features/1.login/presentation/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
    required this.rol,
  });

  final UserRol rol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stateLogin = ref.watch(loginController);
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
                    const SubtitleWidget('Mis datos:'),
                    DniWidget(stateLogin: stateLogin),
                  ],
                ),
                SectionWidget(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  children: [
                    const SubtitleWidget('Agrotech:'),
                    SectionWidget(
                      background: colors.white,
                      children: [
                        if (rol == UserRol.supervisor) const SupervisorOptions(),
                        if (rol == UserRol.obrero) const ObreroOptions(),
                        if (rol == UserRol.gestor) const GestorOptions(),
                      ],
                    ),
                  ],
                ),
                SectionWidget(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  children: [
                    InkWell(
                      onTap: () => context.remplaceRoute(const LoginPage()),
                      child: SectionWidget(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        background: colors.white,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SubtitleWidget('Cerrar sesión'),
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

enum UserRol {
  supervisor,
  obrero,
  gestor,
  lock,
}
