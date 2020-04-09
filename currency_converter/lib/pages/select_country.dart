import 'package:flutter/material.dart';
import 'package:currencyconverter/classes/country.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<Country> countries = [
    Country(displayName: 'Brazil', currency: 'BRL', imageFileName: 'brazil.png'),
    Country(displayName: 'Canada', currency: 'CAD', imageFileName: 'canada.png'),
    Country(displayName: 'France', currency: 'EUR', imageFileName: 'france.png'),
    Country(displayName: 'Iran', currency: 'IRR', imageFileName: 'iran.png'),
    Country(displayName: 'Israel', currency: 'ILS', imageFileName: 'israel.png'),
    Country(displayName: 'Russia', currency: 'RUB', imageFileName: 'russia.png'),
    Country(displayName: 'Spain', currency: 'EUR', imageFileName: 'spain.png'),
    Country(displayName: 'United Kingdom', currency: 'GBP', imageFileName: 'uk.png'),
    Country(displayName: 'United States Of America', currency: 'USD', imageFileName: 'usa.png'),
  ];

  void updateSelection(index){
    Navigator.pop(context, {
      'currency': countries[index].currency,
      'imageFileName': countries[index].imageFileName,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Country Selection'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25)
            )
        ),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index){
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ListTile(
              onTap: () => updateSelection(index),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/country_images/${countries[index].imageFileName}'),
              ),
              title: Text(
                countries[index].displayName,
              ),
            ),
          );
        },
      ),
    );
  }
}
