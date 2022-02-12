import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  // const ErrorScreen({Key? key}) : super(key: key);
  String txt = "";
  ErrorScreen.Test(this.txt);

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("${widget.txt}"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${widget.txt}",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              RaisedButton(
                  color: Colors.red,
                  child: Text("Home"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
