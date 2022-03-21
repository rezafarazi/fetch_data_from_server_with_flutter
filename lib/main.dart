import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:js_test/model/user.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: main_ac_state(),
    );
  }
}



class main_ac_state extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => main_ac();
  
}

class main_ac extends State<main_ac_state>
{

  late Future<user_model> user_data;

  @override
  void initState() 
  {
    super.initState();
    user_data=fetch_data();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Center(
        child: FutureBuilder<user_model>(
          future: user_data,
          builder: (context,snapshot){
            if(snapshot.hasData)
            {
              return Text(snapshot.data!.name);
            }

            return Text("Wait Please");
          },
        ),
      ),
    );
  }


  //Fetch Data Start
  Future<user_model> fetch_data() async
  {
    var response = await http.get(Uri.parse('https://rezafarazi.github.io/Online_Json_Api/user_example.json'));
    if(response.statusCode==200)
    {
      return user_model.from_json(jsonDecode(response.body));
    }
    else
    {
      throw new Exception("Can Not Work");
    }
  }
  //Fetch Data End


}