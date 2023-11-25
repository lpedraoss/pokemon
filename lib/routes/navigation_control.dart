import 'package:flutter/material.dart';
import 'package:pokemon/presentation/view/hellow_screen.dart';
import 'package:pokemon/presentation/view/home_page.dart';

class NavigationControl extends StatefulWidget {
  ///Control de navegación en la aplicación.
  const NavigationControl({Key? key}) : super(key: key);

  @override
  NavigationControlState createState() => NavigationControlState();
}

class NavigationControlState extends State<NavigationControl> {
  String? screenSelected = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
              child: MyHomePage(
            title: 'Pokemon a la vista',
            onNavigate: (String screenName) {
              setState(() {
                screenSelected = screenName;
              });
            },
          )),
          if (screenSelected == "helloScreen")
            const MaterialPage(child: HellowScreen()),
        ],
        onPopPage: (route, result) => (route.didPop(result)) ? true : false,
      ),
    );
  }
}
