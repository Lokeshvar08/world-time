import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api end point
  String city;

  WorldTime({this.location,this.url,this.flag,this.city});
  Future<void> getTime() async {
    try{
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      print(data);

      //get properties from data

      String datetime = data['datetime'];

      String offsethours = data['utc_offset'].substring(1,3);
      String offsetmin= data['utc_offset'].substring(4,6);


      //print(datetime);
      //print(offset_hours);
      //print(offset_min);

      //create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsethours),minutes: int.parse(offsetmin)));
      //set time property
      time = DateFormat.jm().format(now);
      //bool isDayTime;
      //isDayTime = now.hour > 6 && now.hour<19 ? true : false ;
      //print(isDayTime);
    }

    catch(e){
      print('Error occured');
      time='Network Error';
      //isDayTime=false;
    }


  }
}