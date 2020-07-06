import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.Dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          animation.value.toString(),
          style: new TextStyle(fontSize: 50.0),
        ),
      ],
    );
  }
}

class MyApp extends StatefulWidget {
  State createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  static var sayi = new Random();
  static var sayi1 = sayi.nextInt(100);

  static var sayi2 = sayi.nextInt(100);
  static var s1;
  static var s2;

  Timer _timer;
  int _start = 5;
  int _start2 = 1;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              _start--;
              if (_start < 1) {
                durum = true;
                sayacDurum = false;
                if(buttonTiklandi==2)  {
                  buton2=false;
                  cevapdurum=true;
                }
                else buton2=true;
                timer.cancel();


              }
              print(buttonTiklandi);
            }));
  }

  void startTimer2() {
    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              _start2--;
              if (_start2 < 1) {
                durum = false;
                fieldDurum = true;
                buton2=false;
                containerdurum=true;
                timer.cancel();


              }
            }));
  }

  static var durum = false;
  static var fieldDurum = false;
  static var sayacDurum = true;
  static var containerdurum = false;

  static var buton1 = true;

  static var buton2 = false;
  static var cevapdurum = false;

  @override
  void initState() {
    super.initState();
  }

  int buttonTiklandi = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("TOPLAMA"),
      ),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: new Icon(Icons.play_arrow),
        onPressed: () {
          if (buttonTiklandi == 0) {
            sayacDurum = true;
            startTimer();
            s1 = sayi1;

            ++buttonTiklandi;
          } else if (buttonTiklandi == 1) {
            durum = false;
            sayacDurum = true;

            buttonTiklandi++;
            sayi1 = sayi.nextInt(100);

            startTimer();
            _start = 6;
            s2 = sayi1;
          } else if (buttonTiklandi == 2) {
            durum = false;
            containerdurum=true;

            sayacDurum = false;
            startTimer2();
            print(s1 + s2);
          }

          // _controller.forward(from: 0.0);
        },
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: RaisedButton(
              onPressed: () {
                if (buttonTiklandi == 0) {
                  sayacDurum = true;
                  startTimer();
                  s1 = sayi1;
                  buton1 = false;
                  cevapdurum = false;
                  ++buttonTiklandi;
                  print("ilk tıklama");
                }
              },
              child: Text("1. SAYI GELSİN Mİ",  style: TextStyle(fontSize: 20)),
              color: Colors.red,
            ),
            visible: buton1,
          ),
          Visibility(
            child: RaisedButton(
              onPressed: () {
              if (buttonTiklandi == 1) {
                  durum = false;
                  sayacDurum = true;


                  buttonTiklandi++;
                  sayi1 = sayi.nextInt(100);

                  startTimer();
                  _start = 6;
                  s2 = sayi1;
                  buton2=false;
                  print("ikinic tıklama");
                } else if (buttonTiklandi == 2) {
                  durum = false;
                  containerdurum = true;
                  buton2=false;
                  sayacDurum = false;
                  startTimer2();
                  print(s1 + s2);
                  print("üçüncü");
                }
              },
              child: Text("2. SAYI GELSİN Mİ", style: TextStyle(fontSize: 20)),
              color: Colors.red,
            ),
            visible: buton2,
          ),
          Visibility(
            child: RaisedButton(
              onPressed: () {
                if (buttonTiklandi == 0) {
                  sayacDurum = true;
                  startTimer();
                  s1 = sayi1;

                  ++buttonTiklandi;
                } else if (buttonTiklandi == 1) {
                  durum = false;
                  sayacDurum = true;

                  buttonTiklandi++;
                  sayi1 = sayi.nextInt(100);

                  startTimer();
                  _start = 6;
                  s2 = sayi1;
                } else if (buttonTiklandi == 2) {
                  durum = false;
                  cevapdurum=false;
                  sayacDurum = false;
                  startTimer2();
                  print(s1 + s2);
                }
              },
              child: Text("HAYDİ BUL  BUL", style: TextStyle(fontSize: 20),),
              color: Colors.red,
            ),
            visible: cevapdurum,
          ),
          Visibility(
            child: Container(
              child: Text(
                "$s1 + $s2 = ? ",
                style: TextStyle(fontSize: 32),
              ),
            ),
            visible: containerdurum,
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
            child: Text(
              "${sayi1}",
              style: TextStyle(fontSize: 180, fontWeight: FontWeight.bold),
            ),
            visible: durum,
          ),
          Visibility(
            child: TextField(
              keyboardType: TextInputType.number,

              textInputAction: TextInputAction.done,

              maxLines: 5,

              autofocus: false,

              maxLength: 20,
              maxLengthEnforced: true,

              onChanged: (String s) => debugPrint("on changed: $s"),
              onSubmitted: (String s) {
                debugPrint("on submitted : $s");
              },
              cursorColor: Colors.white,

              //focusNode: _focusNode,

              decoration: InputDecoration(
                hintText: "Belirlediğiniz basamak sayısını giriniz",
                hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade400),
                labelText: "Cevap Alanı",
                labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.cyan,
                      width: 3,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3,
                    )),

                /*prefixIcon: Icon(
                    Icons.edit,
                    size: 26,
                    color: Colors.white,
                  ),*/
                suffixIcon: IconButton(
                    icon: IconButton(
                  icon: Icon(Icons.keyboard_voice),
                  onPressed: () {},
                  color: Colors.red,
                )),
                /*filled: true,
                  fillColor: Colors.black26*/
              ),
            ),
            visible: fieldDurum,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Visibility(
              child: Text(
                "${_start}",
                style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
              ),
              visible: sayacDurum,
            )),
          ),

        ],
      ),
    );
  }
}
