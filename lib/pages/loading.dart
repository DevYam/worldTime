import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async{
    // get of http package behaves differently from what is demonstrated in tutorial
    // uri.https determines that request is of type https so we do not have append https
    //before url also the latter part of FQDN is after comma
   Response response = await get(Uri.https('jsonplaceholder.typicode.com','/todos/1'));
   Map data = jsonDecode(response.body);
   print(data);
   print(data['title']);

  }

  @override
  void initState() {
    super.initState();
    // InitSate is used to get data from the third party api
    getData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }
}
