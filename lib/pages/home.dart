import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments ;
    print(data);
    //set background
    String bgimage = 'assets/nig.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgimage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context , '/location');
                setState(() {
                  data= {
                    'time' : result['time'],
                    'location' : result['location'],
                    'city' : result['city'],
                    'flag' : result['flag']
                  };
                });
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit'),
              color: Colors.white,
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/${data['flag']}'),
                ),
              ],
            ),
            /*Text(
              data['location'],
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 28.0,
                color: Colors.white,
              ),
            ),*/
            SizedBox(height: 20.0,),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 66,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 3.0,),
            Text(
              '${data['city']},${data['location']}',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2.0,
                color: Colors.white
              ),
            ),

          ],
        ),
        ),
      ),
      );
    }
}
