import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, this.searchText, required this.onSend});

  final String? searchText;
  final Function onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromRGBO(255, 255, 255, 0.9),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: searchText ?? 'Buscar',
                border: InputBorder.none,
              ),
              onSubmitted: (value) => onSend(value),
            ),
          ),
        ],
      ),
    );
  }
}
