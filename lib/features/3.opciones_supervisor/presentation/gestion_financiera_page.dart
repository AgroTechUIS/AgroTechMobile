import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/statistics_cultivo_page.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/custom_card_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GestionFinancieraIngresos extends ConsumerWidget {
  const GestionFinancieraIngresos({super.key});

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
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Gestion Ingresos',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SectionScrollWidget(
              showSearch: false,
              children: [
                CustomCardWidget(
                  title: 'Cultivo de Naranja',
                  subtitle: 'Finca del Sol',
                  content: const [
                    'Direccion: Calle Principal 123',
                    'Zona: zona A',
                    'Id: 1234',
                    'Fecha inicio: 10/01/2023',
                    'Fecha fin: 10/06/2023'
                  ],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/vertical-shot-orange-fruit-tree_181624-12354.jpg?size=626&ext=jpg',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StadisticCultivoPage(idCultivo: '1234')),
                    );
                  },
                ),
                CustomCardWidget(
                  title: 'Cultivo de Mora',
                  subtitle: 'Finca del Sol',
                  content: const [
                    'Direccion: Calle Principal 123',
                    'Zona: zona B',
                    'Id: 1235',
                    'Fecha inicio: 10/01/2023',
                    'Fecha fin: 10/06/2023'
                  ],
                  imagenUrl: 'https://img.freepik.com/premium-photo/blackberries_611759-66.jpg',
                  onPressed: () {},
                ),
                CustomCardWidget(
                  title: 'Cultivo de Manzana',
                  subtitle: 'Finca del Sol',
                  content: const [
                    'Direccion: Calle Principal 123',
                    'Zona: zona A',
                    'Id: 1234',
                    'Fecha inicio: 10/01/2023',
                    'Fecha fin: 10/06/2023'
                  ],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/fresh-tasty-red-apples-wooden-basket-red-autumn-background_1220-1716.jpg',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
