import 'package:agrotech/common_utilities/config/colors_theme.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    this.searchText,
    required this.onSend,
  });

  final String? searchText;
  final Function onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: searchText ?? 'Buscar',
                border: InputBorder.none,
              ),
              onSubmitted: (value) => onSend(value),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
