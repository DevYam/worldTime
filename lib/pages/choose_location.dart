import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  void getData() async{
    //Simulating a network call
    String Name = await Future.delayed(Duration(seconds: 3),(){
      return 'Divyam';
    });

    //Simulating a network call
    String Does = await Future.delayed(Duration(seconds: 2),(){
      return 'Eat, Sleep, Youtube, Repeat';
    });

    print('$Name - $Does');

  }

  @override
  void initState() {
    super.initState();
    // InitSate is used to get data from the third party api
    print('InitState called before getData');

    getData();

    print('Statement after getData');
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
