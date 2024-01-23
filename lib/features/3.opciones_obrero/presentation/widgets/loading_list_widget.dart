import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/background_body_widget.dart';
import 'package:agrotech/common_utilities/widgets/header_page_widget.dart';
import 'package:agrotech/common_utilities/widgets/section_scroll_widget.dart';
import 'package:agrotech/features/3.opciones_obrero/presentation/widgets/loading_boxWidget.dart';
import 'package:flutter/material.dart';

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({
    super.key,
    this.showSearch = true,
    this.heightItem = 170,
    this.itemsLenght = 3,
    this.itemMargin = 10,
    this.itemBorder = 20,
  });

  final bool showSearch;
  final double heightItem;
  final int itemsLenght;
  final double itemMargin;
  final double itemBorder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: colors.appbar,
      ),
      body: BackgroundBodyWidget(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const HeaderPageWidget(''),
            SectionScrollWidget(
              children: [
                if (showSearch)
                  LoadingBoxWidget(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      height: 60,
                    ),
                  ),
                for (int i = 0; i < (itemsLenght); i++)
                  LoadingBoxWidget(
                    child: Container(
                      margin: EdgeInsets.all(itemMargin),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(itemBorder),
                      ),
                      height: heightItem,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
