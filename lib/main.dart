import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/widget/category_screen.dart';
import 'package:flutter_grocery_app/widget/login_screen.dart';
import 'package:flutter_grocery_app/widget/registration_form.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/registration": (contex) => Registration(),
        "/login": (contex) => LoginScreen(),
        "/category": (contex) => CategoryScreen(),
      },
    );
  }
}
