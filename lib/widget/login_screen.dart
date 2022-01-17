import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'error_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingControllerEmail = new TextEditingController();
  TextEditingController textEditingControllerPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Login"),),
        body: Center(
          child: new Form(

            child: new Column(
              children: [

                new TextFormField(controller: textEditingControllerEmail ,decoration: InputDecoration(hintText: "Email"),),
                new TextFormField(controller: textEditingControllerPassword,decoration: InputDecoration(hintText : "Password"),),

                RaisedButton(color: Colors.lightBlue,

                  onPressed: login,

                  child: Text("Login",style: new TextStyle(color: Colors.white),),
                ),
              ],
            ) ,

          ) ,
        ),
      ),
    );
  }

  void login() async{

    try {

          Map<String,String> headers ={
            "Content-Type" : "application/json",
          };

          var response = await http.post(Uri.parse(
              "https://grocery-second-app.herokuapp.com/api/auth/login"),
              body: jsonEncode( {

                "email": "${textEditingControllerEmail.text}",
                "password": "${textEditingControllerPassword.text}",

              }),headers: headers
          );

        //  print(response.statusCode);

         // print("++++++++++  "+response.body);
          var decodeData = jsonDecode(response.body);


          print(decodeData);

          var msg = decodeData["message"];
          print(msg);


      if(msg == null)
        {
          Navigator.pushNamed(context, "/category");
        }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ErrorScreen.Test("$msg")));
      }






        }
        catch(e)
        {
          print("--------------  $e");
        }



  }
}
