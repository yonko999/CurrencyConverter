import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getCurrencyRate(convertionList) async {
    String conv = convertionList[0]['currency'] + "_" + convertionList[1]['currency'];
    String url = 'https://free.currconv.com/api/v7/convert?q=$conv&compact=ultra&apiKey=4d0d0688e0a2d7f06e0a';
    String rate;
    try{
      Response res = await get(url);
      Map data = jsonDecode(res.body);
      rate = data[conv].toString();
    }
    catch(e){
      print(e.toString());
      rate = "could not get info please try again";
    }
    Navigator.pushReplacementNamed(context, '/result', arguments: {
      'convertList': convertionList,
      'rate': rate
    });
  }

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero, (){
      setState(() {
        dynamic convert = ModalRoute.of(context).settings.arguments;
        convert = convert['convertList'];
        getCurrencyRate(convert);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[400],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.grey[200],
          size: 75,
        ),
      ),
    );
  }
}
