import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> content;
  final String imagenUrl;
  final void Function()? onPressed;
  final double? imageHeight;
  final String? buttonText;

  const CustomCardWidget({
    super.key,
    required this.imagenUrl,
    required this.title,
    required this.subtitle,
    required this.content,
    this.onPressed,
    this.imageHeight,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Card(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 20),
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: imageHeight ?? MediaQuery.of(context).size.height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(imagenUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: imageHeight ?? MediaQuery.of(context).size.height * 0.12,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  ),
                  Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    subtitle.isNotEmpty
                        ? Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 8.0),
                    ...content.map(
                      (widgetText) => Text(widgetText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onPressed != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      colors.green,
                    ),
                  ),
                  child: Text(buttonText ?? 'Ver Informe'),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
