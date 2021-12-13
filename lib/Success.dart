import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoteevent/Header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  String myurl = Uri.base.toString();
  String? para1 = Uri.base.queryParameters["session_id"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(myurl);
    print(para1);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Color.fromRGBO(207, 211, 211, 1.0),
          child: Column(
            children: [
              Header(),
              Container(
                color: Colors.greenAccent,
                width: 500,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "Payment Successful. Please check your email for the ticket.",
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Montserrat',
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "In case of any issue, you can contact us at ajinkya@hoteapp.com",
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Montserrat',
                          fontSize: 18),
                    )
                  ],
                )),
              )
            ],
          ),
        ));
  }
}
