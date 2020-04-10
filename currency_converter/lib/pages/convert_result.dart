import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  dynamic convert;


  @override
  Widget build(BuildContext context) {
    // one liner to load data if not already loaded
    convert = convert.toString() != 'null' ? convert : ModalRoute.of(context).settings.arguments;
    String rate = convert['rate'];
    convert = convert['convertList'];


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Result'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25)
          )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/country_images/${convert[0]['imageFileName']}'),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    '1 x ${convert[0]['currency']}',
                    style: TextStyle(
                      color: Colors.purple[600],
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                '=',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.purple[600],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/country_images/${convert[1]['imageFileName']}'),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    //TODO: make a request to get real convertion
                    '$rate x ${convert[1]['currency']}',
                    style: TextStyle(
                      color: Colors.purple[600],
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
