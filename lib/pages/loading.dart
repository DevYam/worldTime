import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


setUpWorldTime() async {
  WorldTime worldTime = WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
  await worldTime.getTime();
  // print(worldTime.time);
  // setState(() {
  //   time = worldTime.time;
  // });
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': worldTime.location,
    'flag': worldTime.flag,
    'time': worldTime.time,
    'isDaytime' : worldTime.isDaytime
  });

}


@override
  void initState() {
    super.initState();
    // InitSate is used to get data from the third party api
    setUpWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
