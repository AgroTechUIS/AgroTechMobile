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
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background-page.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
