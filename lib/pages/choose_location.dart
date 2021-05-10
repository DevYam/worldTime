import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void initState() {
    super.initState();
    // InitSate is used to get data from the third party api
    print('InitState called ');
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print('Build called');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            count++;
          });
        },
        child: Text('Pressed $count times'),
      ),
    );
  }
}
