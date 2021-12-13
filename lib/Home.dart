import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoteevent/Header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String checkoutLink;
  String myurl = Uri.base.toString();
  String? para1 = Uri.base.queryParameters["session_id"];
  @override
  void initState() {
    super.initState();
    if (para1 != null) {
      print(para1);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Alert Dialog Box"),
          content: Text("You have raised a Alert Dialog Box"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("okay"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> checkoutCall() async {
    await canLaunch(checkoutLink)
        ? await launch(checkoutLink)
        : throw 'Could not launch $checkoutLink';
  }

  Future<void> stripeCheckoutJson() async {
    final redirectLink = await http.post(
      "https://us-central1-hoteapp-8b290.cloudfunctions.net/api2/create-checkout-session",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'name': "New Years Eve", 'amount': 2000}),
    );

    print(json.decode(redirectLink.body)['sessionURL']);

    setState(() {
      checkoutLink = json.decode(redirectLink.body)['sessionURL'];
    });

    checkoutCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Color.fromRGBO(207, 211, 211, 1.0),
          child: Column(
            children: [
              Header(),
              Container(
                width: 800,
                child: Column(
                  children: [
                    Text(
                      "New Years Eve",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "@Sant'olina",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "9867 Wilshire Blvd Beverly Hills, CA 90210",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 40.0,
                      width: 200,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red,
                        elevation: 7.0,
                        child: TextButton(
                          child: Text('Pay \$20.00'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.red,
                            onSurface: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                          ),
                          onPressed: stripeCheckoutJson,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image(
                      image: AssetImage("assets/images/event.jpeg"),
                      width: 550,
                      height: 350,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
