import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'error_page.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController textEditingControllerName = new TextEditingController();
  TextEditingController textEditingControllerEmail =
      new TextEditingController();
  TextEditingController textEditingControllerPassword =
      new TextEditingController();
  TextEditingController textEditingControllerMobile =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Registration"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Center(
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: textEditingControllerName,
                    decoration: InputDecoration(hintText: "First Name"),
                  ),
                  TextFormField(
                    controller: textEditingControllerEmail,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  TextFormField(
                    controller: textEditingControllerPassword,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  TextFormField(
                    controller: textEditingControllerMobile,
                    decoration: InputDecoration(hintText: "Mobile"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.amber,
                      onPressed: () {
                        registerData();
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registerData() async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      var response = await http.post(
          Uri.parse(
              "https://grocery-second-app.herokuapp.com/api/auth/register"),
          body: jsonEncode({
            "firstName": "${textEditingControllerName.text}",
            "email": "${textEditingControllerEmail.text}",
            "password": "${textEditingControllerPassword.text}",
            "mobile": "${textEditingControllerMobile.text}"
          }),
          headers: headers);

      var decodeData = jsonDecode(response.body);
      var msg = decodeData["message"];
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ErrorScreen.Test("$msg")));
    } catch (e) {
      print("e");
    }
  }
}
