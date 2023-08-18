import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/section_widget.dart';
import 'package:agrotech/features/2.home/presentation/widgets/text_item_widget.dart';
import 'package:agrotech/features/1.login/presentation/login_state.dart';
import 'package:flutter/material.dart';

class DniWidget extends StatelessWidget {
  const DniWidget({
    super.key,
    required this.stateLogin,
  });

  final LoginState stateLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      backgroundImage: const NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135768.png'),
                    ),
                    Expanded(
                      child: SectionWidget(
                        background: colors.appbar,
                        children: [
                          Text(
                            'Id: ${stateLogin.idusuario}',
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
                TextItemWidget(title: 'Nombre:', text: stateLogin.nombre),
                TextItemWidget(title: 'Cedula:', text: stateLogin.cedula),
                TextItemWidget(title: 'Correo:', text: stateLogin.correo),
                TextItemWidget(title: 'Teléfono:', text: stateLogin.telefono),
                TextItemWidget(title: 'Rol:', text: stateLogin.rol),
                TextItemWidget(title: 'Ingreso:', text: stateLogin.ingreso),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
