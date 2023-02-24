import 'dart:math';
import 'dart:ui';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class PaysDetailsPage extends StatefulWidget {
  String pays = "";
  PaysDetailsPage(this.pays);
  @override
  State<PaysDetailsPage> createState() => _PaysDetailsPageState();
}

class _PaysDetailsPageState extends State<PaysDetailsPage> {
  var paysData;
  @override
  void initState() {
    super.initState();
    gePaysData(widget.pays);
  }

  void gePaysData(String pays) {
    print("pays: " + pays);
    String url = "https://restcountries.com/v2/name/${pays}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.paysData = json.decode(resp.body);
        debugPrint('paysData: paysData');
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page pays Details ${widget.pays}')),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Image.network(
                paysData[0]['flags']['png'],
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    paysData[0]['name'],
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    paysData[0]['nativeName'],
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(children: [
                      Text(
                        "Adminstration:",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        " Capitale: ${paysData[0]['capital']}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " Language: ${paysData[0]['languages'][0]['name']}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      Text(
                        "Géographique:",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        " Région: ${paysData[0]['region']}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " Superficie: ${paysData[0]['area']}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " Fuseau Horaire: ${paysData[0]['timezones'][0]}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  Text(
                    "Démographique:",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    " Population: ${paysData[0]['population']}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
        // Text(
        //   "${(paysData['list'][index]['main']['temp'])}",
        //   style: TextStyle(
        //       fontSize: 22, fontWeight: FontWeight.bold),
        // ),
      ),
    );
  }
}
