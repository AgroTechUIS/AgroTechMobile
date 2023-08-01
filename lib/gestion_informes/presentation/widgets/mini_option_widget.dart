import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MiniOptionWidget extends StatelessWidget {
  const MiniOptionWidget({
    Key? key,
    required this.title,
    required this.iconRoute,
    required this.goPage,
  }) : super(key: key);

  final String title;
  final String iconRoute;
  final Widget goPage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          height: 110,
          width: 90,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 50,
                child: SvgPicture.asset(
                  iconRoute,
                  color: colors.appbar,
                  semanticsLabel: 'A red up arrow',
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => goPage),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: colors.appbar,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: 40,
              child: Icon(
                Icons.arrow_right_sharp,
                color: colors.white,
                size: 24,
              ),
            ),
          ),
        )
      ],
    );
  }
}
