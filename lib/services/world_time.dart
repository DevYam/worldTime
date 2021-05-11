import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

String location; //Location name for the ui
late String time;  //time in that location
String flag; // url to an asset flag icon
String url; //location url
late bool isDaytime;

WorldTime({required this.location, required this.flag, required this.url});


Future<void> getTime() async {

  try {
// get of http package behaves differently from what is demonstrated in tutorial
// uri.https determines that request is of type https so we do not have append https
//before url also the latter part of FQDN is after comma
    Response response = await get(
        Uri.http('worldtimeapi.org', '/api/timezone/$url'));
    Map data = jsonDecode(response.body);

// print(data);
    String datetime = data['datetime'];
    String utc_offset_hours = data['utc_offset'].substring(1, 3);
    String utc_offset_minutes = data['utc_offset'].substring(4, 6);
// print(datetime);
print('hour offset is $utc_offset_hours');
print('minute offset is $utc_offset_minutes');

//Parsing the datetime
    DateTime now = DateTime.parse(datetime);

// adding 05:30 as a number was giving exceptions so parsing and adding them separately
    now = now.add(Duration(hours: int.parse(utc_offset_hours)));
    now = now.add(Duration(minutes: int.parse(utc_offset_minutes)));
    print('now is $now');

    isDaytime = now.hour>6 && now.hour<18 ? true : false;

    //setting the time property
    time = DateFormat.jm().format(now);
  } catch(e){
    time = 'Could not get time data';
    print('Error in getting time $time');
  }

}
}

