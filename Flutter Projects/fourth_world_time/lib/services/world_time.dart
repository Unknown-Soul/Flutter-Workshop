import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String location; // location name for UI
  String time; // Time at that location
  String flag; //url to assert flag of location
  String url; // url api endpoint
  bool isdaytime;

  WorldTime({this.location, this.flag, this.url});// constructor setting up value
  Future<void> getTime() async {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body); //json decode change jason data
      //print(data);
      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      offset = offset.substring(1, 3);
      print(offset);
      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //set time  property
      isdaytime = now.hour > 6 && now.hour < 20  ? true:false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught $e');
      time = 'could not get time data';
    }
  }
}