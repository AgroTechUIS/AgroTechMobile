import 'package:flutter/material.dart';

class HistoryCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> content;
  final Color? subtitleColor;

  const HistoryCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 20),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(),
                title.isNotEmpty
                    ? Text(
                        title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: subtitleColor ?? Colors.black,
                        ),
                      )
                    : const SizedBox(),
                subtitle.isNotEmpty
                    ? Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
    );
  }
}
