import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:agrotech/common_utilities/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class SectionScrollWidget extends StatelessWidget {
  const SectionScrollWidget({
    Key? key,
    required this.children,
    //this.showSearch,
    //this.onSend,
    this.addWidget,
  }) : super(key: key);

  final List<Widget> children;
  //final bool? showSearch;
  //final Function? onSend;
  final Widget? addWidget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors.blackTransparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            /*showSearch ?? true
                ? SearchBarWidget(
                    onSend: (value) => onSend!(value) ?? () {},
                  )
                : const SizedBox(),*/
            addWidget ?? const SizedBox(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
