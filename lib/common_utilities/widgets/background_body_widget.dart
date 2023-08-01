import 'package:flutter/material.dart';

class BackgroundBodyWidget extends StatelessWidget {
  const BackgroundBodyWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height + 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://img.freepik.com/free-vector/abstract-gray-stripes-background_1035-19089.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
