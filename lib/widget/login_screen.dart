import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'error_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingControllerEmail =
      new TextEditingController();
  TextEditingController textEditingControllerPassword =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Home"),
        ),
        body: Center(
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                    child: TextFormField(
                      controller: textEditingControllerEmail,
                      decoration: InputDecoration(hintText: "Email"),
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                    child: TextFormField(
                      controller: textEditingControllerPassword,
                      decoration: InputDecoration(hintText: "Password"),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        login();
                      },
                      child: Text("LogIn"),
                    ),
                    RaisedButton(
                      color: Colors.pinkAccent,
                      onPressed: () {
                        Navigator.pushNamed(context, "/registration");
                      },
                      child: Text("SignUp"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      var response = await http.post(
          Uri.parse("https://grocery-second-app.herokuapp.com/api/auth/login"),
          body: jsonEncode({
            "email": "${textEditingControllerEmail.text}",
            "password": "${textEditingControllerPassword.text}",
          }),
          headers: headers);

      var decodeData = jsonDecode(response.body);

      var msg = decodeData["message"];

      if (msg == null) {
        Navigator.pushNamed(context, "/category");
      } else {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ErrorScreen.Test("$msg")));
      }
    } catch (e) {
      print("--------------  $e");
    }
  }
}
