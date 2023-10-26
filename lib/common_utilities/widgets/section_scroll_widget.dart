import 'package:agrotech/common_utilities/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class SectionScrollWidget extends StatelessWidget {
  const SectionScrollWidget({
    Key? key,
    required this.children,
    this.showSearch,
    this.onSend,
  }) : super(key: key);

  final List<Widget> children;
  final bool? showSearch;
  final Function? onSend;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 0,
        color: const Color.fromRGBO(38, 38, 38, 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            showSearch ?? true
                ? SearchBarWidget(
                    onSend: (value) => onSend!(value) ?? () {},
                  )
                : const SizedBox(),
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
