import 'package:flutter/material.dart';
import 'package:currencyconverter/pages/home.dart';
import 'package:currencyconverter/pages/select_country.dart';
import 'package:currencyconverter/pages/convert_result.dart';
import 'package:currencyconverter/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Home(),
    '/select' : (context) => SelectCountry(),
    '/result' : (context) => Result(),
    '/loading' : (context) => Loading(),
  },
));