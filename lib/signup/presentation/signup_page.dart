import 'package:agrotech/config/theme_provider.dart';
import 'package:agrotech/signup/presentation/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/services.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<FormState> _formRKey = GlobalKey<FormState>();
    final TextEditingController namesController = ref.watch(namesProvider);
    final TextEditingController surnamesController =
        ref.watch(surnamesProvider);
    final TextEditingController emailController = ref.watch(correoProvider);
    final TextEditingController passwordController =
        ref.watch(contrasenaProvider);
    final TextEditingController confirmPasswordController =
        ref.watch(confirmContrasenaProvider);
    final TextEditingController phoneController = ref.watch(phoneProvider);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/fondoAuth.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Form(
                key: _formRKey,
                child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white.withOpacity(0.4),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                  const Text(
                                    "Registra tu cuenta",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 22,
                                        fontFamily: 'Poppins'),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Crea una cuenta. Es gratis",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[700]),
                                  ),
                                  const SizedBox(height: 10),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child:
                                          Text('Registra tus nombres completos',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ))),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Nombres',
                                    ),
                                    keyboardType: TextInputType.name,
                                    controller: namesController,
                                    validator: (value) {
                                      if (value == null) {
                                        return null;
                                      }
                                      if (value.isEmpty) {
                                        return 'Por favor, ingresa tus nombres';
                                      }
                                      final emailRegex = RegExp('[a-zA-Z ]');
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Ingresa nombres válidos.';
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: null,
                                  ),
                                  const SizedBox(height: 10),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Registra tus apellidos',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ))),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Apellidos',
                                    ),
                                    keyboardType: TextInputType.name,
                                    controller: surnamesController,
                                    validator: (value) {
                                      if (value == null) {
                                        return null;
                                      }
                                      if (value.isEmpty) {
                                        return 'Por favor, ingresa tus apellidos';
                                      }
                                      final emailRegex = RegExp('[a-zA-Z ]');
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Ingresa apellidos válidos.';
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: null,
                                  ),
                                  const SizedBox(height: 10),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Registra tu correo electrónico',
                                        style: TextStyle(
                                          // Ajusta el estilo del texto según tus preferencias
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      )),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    validator: (value) {
                                      if (value == null) {
                                        return null;
                                      }
                                      if (value.isEmpty) {
                                        return 'Por favor, ingresa un correo electrónico.';
                                      }
                                      final emailRegex = RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                      if (!emailRegex.hasMatch(value)) {
                                        return 'Ingresa un correo electrónico válido.';
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: null,
                                    decoration: const InputDecoration(
                                      labelText: "Correo electrónico",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 3),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Crea tu contraseña (Minimo una minuscula, una mayuscula, un digito y 8 caracteres)',
                                        style: TextStyle(
                                          // Ajusta el estilo del texto según tus preferencias
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      )),
                                  TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                      labelText: "Contraseña",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 3),
                                      ),
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null) {
                                        return null;
                                      }
                                      if (value.isEmpty) {
                                        return 'Por favor, ingresa una contraseña.';
                                      }
                                      // ignore: unrelated_type_equality_checks
                                      if (value == confirmPasswordController) {
                                        return 'null';
                                      }

                                      final passRegex = RegExp(
                                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');
                                      if (!passRegex.hasMatch(value)) {
                                        return 'No cumple requisitos';
                                      }
                                      // ignore: unrelated_type_equality_checks
                                      if (!passRegex.hasMatch(value) &&
                                          // ignore: unrelated_type_equality_checks
                                          value != confirmPasswordController) {
                                        return 'Las contraseñas tienen que coincidir y cumplir requisitos';
                                      }
                                      // ignore: unrelated_type_equality_checks
                                      if (value !=
                                              value
                                                  .isEmpty && // ignore: unrelated_type_equality_checks
                                          value !=
                                              confirmPasswordController.text) {
                                        return 'Las contraseñas tienen que coincidir';
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: null,
                                  ),
                                  const SizedBox(height: 10),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Confirma tu contraseña',
                                        style: TextStyle(
                                          // Ajusta el estilo del texto según tus preferencias
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      )),
                                  TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: confirmPasswordController,
                                    decoration: const InputDecoration(
                                      labelText: "Confirmar contraseña",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 3),
                                      ),
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null) {
                                        return null;
                                      }
                                      if (value.isEmpty) {
                                        return 'Por favor, ingresa una contraseña.';
                                      }
                                      // ignore: unrelated_type_equality_checks
                                      if (value == passwordController) {
                                        return 'null';
                                      }
                                      // ignore: unrelated_type_equality_checks

                                      final passRegex = RegExp(
                                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');
                                      if (!passRegex.hasMatch(value)) {
                                        return 'No cumple requisitos';
                                      }
                                      // ignore: unrelated_type_equality_checks
                                      if (value != value.isEmpty &&
                                          // ignore: unrelated_type_equality_checks
                                          value != passwordController.text) {
                                        return 'Las contraseñas tienen que coincidir';
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: null,
                                  ),
                                  const SizedBox(height: 10),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Ingresa tu telefono',
                                        style: TextStyle(
                                          // Ajusta el estilo del texto según tus preferencias
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      )),
                                  /*TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: phoneController,
                                    decoration: const InputDecoration(
                                      labelText: "Ingresa tu telefono",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 3),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return null;
                                      }
                                      if (value.isEmpty) {
                                        return 'Debes ingresar tu numero telefónico';
                                      }
                                    },
                                  ),*/
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, 'login');
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            colors.appbar,
                                          ),
                                          minimumSize:
                                              MaterialStateProperty.all<Size>(
                                            const Size(150, 40),
                                          ),
                                        ),
                                        child: const Text(
                                          "VOLVER",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (_formRKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            // Aquí realizas la acción de enviar el formulario
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            colors.appbar,
                                          ),
                                          minimumSize:
                                              MaterialStateProperty.all<Size>(
                                            const Size(150, 40),
                                          ),
                                        ),
                                        child: const Text(
                                          "REGISTRAR",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ])),
                          ),
                        ])))),
      )),
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toLowerCase(), selection: newValue.selection);
  }
}
