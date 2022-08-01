import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future:  getusers(),
        builder: (context, AsyncSnapshot snapshot){
          //  return const Text("helllo");
          if(snapshot.hasData){ return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (Context, index){
              return ListTile(
                title: Text(snapshot.data[index]['name'],
              ));
             
            });}
            else{
              return const CircularProgressIndicator();
            }
         
        }),
    );
  }


  getusers() async {
     var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
     var data = jsonDecode(response.body);
     print(data);
     return data;
  }

}