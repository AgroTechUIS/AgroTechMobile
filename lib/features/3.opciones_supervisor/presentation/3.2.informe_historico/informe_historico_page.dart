import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/config/network_images.dart';
import 'package:agrotech/common_utilities/widgets/custom_card_widget.dart';
import 'package:agrotech/features/3.opciones_supervisor/presentation/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformeHistoricoPage extends ConsumerWidget {
  const InformeHistoricoPage({super.key});

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
          children: const [
            SizedBox(
              height: 20,
            ),
            HeaderPageWidget('Informe histórico'),
            SectionScrollWidget(
              children: [
                CustomCardWidget(
                  title: 'Labranza  -  N°123',
                  subtitle: 'Finca del Sol - Zona A',
                  content: ['Fecha: 20/05/2023', 'Planta: Maíz', 'Costo: \$100000', 'Periodica: Sí'],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/harvesting-wheat-tranquil-meadow-sunset-generated-by-ai_24640-80628.jpg?w=996&t=st=1686979963~exp=1686980563~hmac=3d6b93340bb888fa767ef198b2a3fe0d9c04477822c49ff0c12de8d7307abff8',
                ),
                CustomCardWidget(
                  title: 'Cosecha  -  N°124',
                  subtitle: 'El Paraíso - Zona A',
                  content: ['Fecha: 20/05/2023', 'Planta: Maíz', 'Costo: \$100000', 'Cantidad: 2000Kg'],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/red-harvesting-machine-corn-farm_181624-58797.jpg?w=740&t=st=1686980239~exp=1686980839~hmac=5b8c0dec4b22bf11418444fa59645692e1d60cf14052f3f7dbb13b58f3241722',
                ),
                CustomCardWidget(
                  title: 'Compra insumo  -  N°123',
                  subtitle: 'Finca del Sol',
                  content: [
                    'insumo:   Abono 1kg',
                    'Cantidad: 200uds',
                    'Costo P.U.:  \$10000',
                    'Costo total: \$2000000',
                    'Fecha compra: 10/01/2023',
                  ],
                  imagenUrl:
                      'https://img.freepik.com/free-photo/fresh-tasty-red-apples-wooden-basket-red-autumn-background_1220-1716.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
