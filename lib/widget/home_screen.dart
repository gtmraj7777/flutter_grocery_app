import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Grocery App"),),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new RaisedButton(onPressed: (){
                Navigator.pushNamed(context, "/login");
              },child: Text("LogIn"),),
              new RaisedButton(onPressed: (){
                Navigator.pushNamed(context, "/registration");


              },child: Text("SignUp"),)
            ],
          ),
        ),
      ),
    );
  }
}
