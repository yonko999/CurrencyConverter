import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Map> convert = [
    {'currency': 'USD', 'imageFileName': 'usa.png'},
    {'currency': 'ILS', 'imageFileName': 'israel.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Currency Converter - Home'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25)
            )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Convert from:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple[600],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/country_images/${convert[0]['imageFileName']}'),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    convert[0]['currency'],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              FlatButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                color: Colors.white,
                onPressed: () => directToCountrySelection(0),
                icon: Icon(
                  Icons.attach_money,
                  color: Colors.grey[700],
                ),
                label: Text(
                  'Select currency',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text(
                'To:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple[600],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/country_images/${convert[1]['imageFileName']}'),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    convert[1]['currency'],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              FlatButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                color: Colors.white,
                onPressed: () => directToCountrySelection(1),
                icon: Icon(
                  Icons.attach_money,
                  color: Colors.grey[700],
                ),
                label: Text(
                  'Select currency',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 60,),
              FlatButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                color: Colors.purple[200],
                  onPressed: directToResult,
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.purple[700],
                  ),
                  label: Text(
                    'Convert',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.purple[700],
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void directToCountrySelection(index) async {
    dynamic res = await Navigator.pushNamed(context, '/select');
    // if something is selected enter if pressed 'back' with no selection then ignore
    if (res != null) {
      setState(() {
        convert[index] = res;
      });
    }
  }

  void directToResult() {
    Navigator.pushNamed(context, '/loading', arguments: {'convertList': convert});
  }
}
