import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/utils/_color.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key, this.onTap})
      : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  @override
  final VoidCallback onTap;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
          top: true,
          child: new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/menu_logo.png"),
                Text(""),
                IconButton(
                    icon: Icon(Icons.close, color: HexColor(txt_color)),
                    onPressed: () async => {
                          // Write code of on Navigation button
                          Navigator.pop(context)
                        }),
              ],
            ),
          )),
    );
  }
}
