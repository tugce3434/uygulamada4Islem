import 'package:flutter/material.dart';

import 'form_islemleri.dart';

class MenuIslemleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "MENÜ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,

              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(2),
                        height: 100,
                        width: 195,

                        child: RaisedButton(
                          color: Colors.blueGrey.shade600,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Bireysel",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormIslemleri(),
                                ));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(2),
                        height: 100,
                        width: 195,
                        child: RaisedButton(
                          color: Colors.blueGrey.shade600,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Yarışma",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Icon(
                                Icons.people,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormIslemleri(),
                                ));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        ));
  }
}