import 'package:agrotech/config/colors_theme.dart';
import 'package:agrotech/config/network_images.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/custom_card_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/header_page_widget.dart';
import 'package:agrotech/gestion_informes/presentation/widgets/section_scroll_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GestionPersonalPage extends ConsumerWidget {
  const GestionPersonalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: colors.backgroundwhite,
      appBar: AppBar(
        title: const Text('Informe Agro Tech'),
        centerTitle: true,
        backgroundColor: colors.appbar,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              netImages.background,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const HeaderPageWidget('Gestion Personal'),
            SectionScrollWidget(
              children: [
                CustomCardWidget(
                  title: 'Labranza  -  N°123',
                  subtitle: 'Finca del Sol - Zona A',
                  content: const [
                    'Fecha: 20/05/2023',
                    'estado: Pendiente',
                  ],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/harvesting-wheat-tranquil-meadow-sunset-generated-by-ai_24640-80628.jpg?w=996&t=st=1686979963~exp=1686980563~hmac=3d6b93340bb888fa767ef198b2a3fe0d9c04477822c49ff0c12de8d7307abff8',
                  onPressed: () {},
                  buttonText: 'Actualizar   ✓',
                ),
                CustomCardWidget(
                  title: 'Cosecha  -  N°124',
                  subtitle: 'El Paraíso - Zona A',
                  content: const [
                    'Fecha: 20/05/2023',
                    'estado: Pendiente',
                  ],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/red-harvesting-machine-corn-farm_181624-58797.jpg?w=740&t=st=1686980239~exp=1686980839~hmac=5b8c0dec4b22bf11418444fa59645692e1d60cf14052f3f7dbb13b58f3241722',
                  onPressed: () {},
                  buttonText: 'Actualizar   ✓',
                ),
                CustomCardWidget(
                  title: 'Revision de plagas  -  N°123',
                  subtitle: 'Finca del Sol',
                  content: const [
                    'Fecha: 20/05/2023',
                    'estado: Pendiente',
                  ],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/fresh-tasty-red-apples-wooden-basket-red-autumn-background_1220-1716.jpg',
                  onPressed: () {},
                  buttonText: 'Actualizar   ✓',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
