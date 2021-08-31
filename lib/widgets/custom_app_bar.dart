import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  CustomAppBar({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarSize = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: statusBarSize),
          color: const Color(0xfff5f5f5),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment:
                CrossAxisAlignment.center, //Center Row contents vertically,
            children: [
              Column(
                children: [Image.asset('assets/images/logo.png')],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
