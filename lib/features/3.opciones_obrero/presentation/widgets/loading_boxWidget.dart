// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBoxWidget extends StatelessWidget {
  final Widget child;

  const LoadingBoxWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(230, 230, 230, 1),
      highlightColor: const Color.fromRGBO(210, 210, 210, 1),
      child: child,
    );
  }
}
