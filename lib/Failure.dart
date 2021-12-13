import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoteevent/Header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Failure extends StatefulWidget {
  @override
  _FailureState createState() => _FailureState();
}

class _FailureState extends State<Failure> {
  @override
  void initState() {
    super.initState();
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
                  width: 500,
                  child: Column(
                    children: [
                      Text(
                        "Payment Failed. Please try again.",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Montserrat',
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "In case of any issue, you can contact us at ajinkya@hoteapp.com",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Montserrat',
                            fontSize: 18),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
