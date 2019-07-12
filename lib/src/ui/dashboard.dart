import 'package:flutter/material.dart';
import 'package:flutter_idealz/src/ui/homeTab.dart';
import 'package:flutter_idealz/src/ui/ticket_tab.dart';
import 'package:flutter_idealz/src/utils/_color.dart';
import 'package:flutter_idealz/src/utils/app_utils.dart';

import 'WishListTab.dart';
import 'cart_tab.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 4, vsync: this);
    controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[
          new HomeTab(),
          new WishListTab(),
          new TicketTab(),
          new CartTab()
        ],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: new Material(
        // set the color of the bottom navigation bar
        color: Colors.white,

        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          // setup the controller
          controller: controller,
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: controller.index == 0
                  ? Image.asset("assets/home_selected.png")
                  : Image.asset("assets/home_unselected.png"),
              text: 'Home',
            ),
            new Tab(
              icon: controller.index == 1
                  ? Image.asset("assets/whislist_selected.png")
                  : Image.asset("assets/whislist_unselected.png"),
              text: 'Wishlist',
            ),
            new Tab(
              icon: controller.index == 2
                  ? Image.asset("assets/ticket_selected.png")
                  : Image.asset("assets/ticket_unselected.png"),
              text: 'Tickets',
            ),
            new Tab(
              icon: controller.index == 3
                  ? Image.asset("assets/cart_selected.png")
                  : Image.asset("assets/cart_unselected.png"),
              text: 'Cart',
            )
          ],
        ),
      ),
      /*  bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.grey),
            title: Text(
              'Wishlist',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie, color: Colors.grey),
            title: Text(
              'Tickets',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
            title: Text(
              'Cart',
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),*/
    );
  }
}

Widget dashboardItem(BuildContext context) {
  return Container(
    child: Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: new Image.asset(
              'assets/walk_through1.png',
            ),
          ),
          Container(
            child: Text(
              'text text whateever extra retrtrtr',
              style: TextStyle(
                fontSize: 22.0,
                color: HexColor(txt_color),
              ),
            ),
          ),
          Container(
            child: Text('text text whateever extra retrtrtr fgdfvfv vfvfvfv',
                style: TextStyle(fontSize: 16.0, color: HexColor(txt_color))),
          ),
          Container(
              child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Text(
                "Get Started",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );*/
            },
          ))
        ],
      ),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
