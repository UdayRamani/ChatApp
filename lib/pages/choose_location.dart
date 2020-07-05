import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}
class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime>location=
      [
        WorldTime(url:'Asia/Kolkata',location:'Kolkata',flag: 'india.jpg'),
        WorldTime(url:'Europe/London',location:'London',flag: 'london.png'),
        WorldTime(url:'America/New_York',location:'New_York',flag: 'new_york.png'),
        WorldTime(url:'Africa/Abidjan',location:'Abidjan',flag: 'abidjan.png'),
        WorldTime(url:'Asia/Dubai',location:'Dubai',flag: 'dubai.png'),
        WorldTime(url:'Europe/Berlin',location:'Berlin',flag: 'Berlin.png'),
        WorldTime(url:'America/Chicago',location:'Chicago',flag: 'Chicago.png'),
        WorldTime(url:'Africa/Nairobi',location:'Nairobi',flag: 'nerobi.png'),
      ];

  void updateTime(index) async {
    WorldTime instance=location[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,
    {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context ,index)
          {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                 },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                    backgroundImage:AssetImage('assets/${location[index].flag}'),
                  ),
                ),
              ),
            );
          },

      ),
    );
  }
}
