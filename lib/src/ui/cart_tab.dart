import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/utils/_color.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';

class CartTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartTabState();
  }
}

class CartTabState extends State<CartTab> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  double opacity = 1;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            color: HexColor(bg_color)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: ScaleTransition(
                    scale: scaleAnimation,
                    child: new Image.asset(
                      'assets/cart_whitoutlogin.png',
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Northing in cart',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: HexColor(txt_color),
                    fontFamily: "Catamaran",
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('You have no items in cart\nYou can see products here once you add to cart',
                    style:
                    TextStyle(fontSize: 12.0, color: HexColor(txt_color),fontFamily: "Catamaran")),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: FlatButton(
                    textColor: Colors.black,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new Text(
                        'Start shopping now',
                        style: TextStyle(color: HexColor(txt_color), fontSize: 15.0, fontFamily: "Catamaran", fontWeight: FontWeight.w500),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    onPressed: () {},
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
