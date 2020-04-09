import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    dynamic convert = ModalRoute.of(context).settings.arguments;
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
                    '3.59 x ${convert[1]['currency']}',
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
