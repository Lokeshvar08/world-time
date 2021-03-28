import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations= [
    WorldTime(url: 'Europe/Berlin',location: 'Germany',flag: 'germany.png',city: 'Berlin'),
    WorldTime(url: 'Asia/Kolkata',location: 'India',flag: 'india.png',city: 'Kolkata'),
    WorldTime(url: 'Europe/London',location: 'UK',flag: 'uk.png',city: 'London'),
    //WorldTime(url: 'America/New_York',location: 'USA',flag:'usa.png'),
    //WorldTime(url: 'America/Toronto',location: 'Canada',flag:'canada.png'),
    WorldTime(url: 'Africa/Johannesburg',location: 'South Africa',flag:'sa.png',city: 'Johannesburg'),
    WorldTime(url: 'Australia/Melbourne',location: 'Australia',flag: 'australia.png',city: 'Melbourne'),
    WorldTime(url: 'Pacific/Auckland',location: 'New Zealand',flag: 'nz.png',city: 'Auckland')
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'city': instance.city
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
