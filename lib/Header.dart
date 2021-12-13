import 'package:flutter/material.dart';
import 'package:hoteevent/Home.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopHeader();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopHeader();
        } else {
          return DesktopHeader();
        }
      },
    );
  }
}

class DesktopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  'Hote',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      'Events',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      '^',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
