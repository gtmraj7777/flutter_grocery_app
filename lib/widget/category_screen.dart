import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/model/category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Category"),
        ),
        body: (categories != null && categories.isNotEmpty)
            ? ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {},
                      leading: Text("${categories[index].catId}"),
                      title: Text("${categories[index].catName}"),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  void loadData() async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      http.Response response = await http.get(
          Uri.parse("https://grocery-second-app.herokuapp.com/api/category"));

      var userData = response.body;
      var decodeData = jsonDecode(userData);

      print(decodeData["data"]);

      //  users = List.from(decodeData).map<User>((item) => User.fromJson(item)).toList();
      categories = List.from(decodeData["data"])
          .map<Category>((cat) => Category.fromJson(cat))
          .toList();
      setState(() {});
    } catch (e) {}
  }
}
