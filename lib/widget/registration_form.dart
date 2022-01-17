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
  TextEditingController textEditingControllerEmail = new TextEditingController();
  TextEditingController textEditingControllerPassword = new TextEditingController();
  TextEditingController textEditingControllerMobile = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Registration"),),
        body: Center(
          child: new Form(

            child: new Column(
              children: [
                new TextFormField(controller: textEditingControllerName,decoration: InputDecoration(hintText : "First Name"),),
                new TextFormField(controller: textEditingControllerEmail,decoration: InputDecoration(hintText: "Email"),),
                new TextFormField(controller: textEditingControllerPassword,decoration: InputDecoration(hintText : "Password"),),
                new TextFormField(controller: textEditingControllerMobile,decoration: InputDecoration(hintText: "Mobile"),),
                RaisedButton(color: Colors.lightBlue,
                  onPressed: (){

                  registerData();

                  },
                  child: Text("Submit",style: new TextStyle(color: Colors.white),),
                ),
              ],
            ) ,

          ) ,
        ),
      ),
    );
  }

  void registerData() async{
       try{
            Map<String,String> headers ={
              "Content-Type" : "application/json",
            };

            var response = await http.post(Uri.parse(
                "https://grocery-second-app.herokuapp.com/api/auth/register"),
                body: jsonEncode( {
                  "firstName": "${textEditingControllerName.text}",
                  "email": "${textEditingControllerEmail.text}",
                  "password": "${textEditingControllerPassword.text}",
                  "mobile": "${textEditingControllerMobile.text}"
                }),headers: headers
            );

           // print("++++++++++  "+response.body);
            var decodeData = jsonDecode(response.body);
            //print(decodeData);

            var msg = decodeData["message"];
           // print(msg);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ErrorScreen.Test("$msg")));


       }
          catch(e)
          {
            print("e");
          }
        }
}
