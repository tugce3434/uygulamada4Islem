import 'package:flutter/material.dart';
import 'dart:math';

class CarpmaIslemiSayfasi extends StatefulWidget {
  @override
  _CarpmaIslemiSayfasiState createState() => _CarpmaIslemiSayfasiState();
}

class _CarpmaIslemiSayfasiState extends State<CarpmaIslemiSayfasi> {
  static var  sayi = new Random();
  static var sayi1 = sayi.nextInt(10);
  static var sayi2 = sayi.nextInt(100);
  static var carpim = sayi1 * sayi2;
  static var durum = false;
  String girilenCevap = "";
  int maxLine = 1;

  FocusNode _fNode;

  @override
  void initState() {
    super.initState();
    durum=false;
    _fNode = FocusNode();
    _fNode.addListener(() {
      setState(() {
        if (_fNode.hasFocus) {
          maxLine = 2;
        } else {
          maxLine = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _fNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*  birinciSayi(){
      var sayi1 = new Random();
      for( var i = 0; i <1; i++) {
        debugPrint(" gelen sayi : ${sayi1.nextInt(100)}");
      }

    }*/

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ÇARPMA",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          mini: true,
          child: Icon(
            Icons.accessibility_new,
            size: 24,
            color: Colors.white,
          ),
          onPressed: () {
            FocusScope.of(context).requestFocus(_fNode);
          },
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                /*border: Border.all(
                  color: Colors.deepOrange.shade300, width: 5, style: BorderStyle.solid,

                ),*/
                gradient: LinearGradient(
                    colors: [Colors.cyan.shade300, Colors.blueGrey.shade200]),
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              ),
              child: Text(
                "Gelen Sayı Değeri: ${sayi1}",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),

              //color: Colors.orange.shade200,
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                /*border: Border.all(
                  color: Colors.deepOrange.shade300, width: 5, style: BorderStyle.solid,

                ),*/
                gradient: LinearGradient(
                    colors: [Colors.cyan.shade300, Colors.blueGrey.shade200]),
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              ),
              child: Text(
                "Gelen Sayı Değeri: ${sayi2}",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),

              //color: Colors.orange.shade200,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                autofocus: false,
                maxLines: maxLine,
                maxLengthEnforced: true,
                focusNode: _fNode,
                onChanged: (String s) => debugPrint("on changed: $s"),
                onSubmitted: (String s) {
                  debugPrint("on submitted : $s");
                  girilenCevap = s;
                  durum = true;
                },
                cursorColor: Colors.white,
                cursorWidth: 3,
                decoration: InputDecoration(
                    hintText: "Cevabı Giriniz",
                    hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    //labelText: "Cevap Alanı ",
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan.shade300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.cyan.shade200,
                          width: 3.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 3,
                        )),
                    icon: Icon(
                      Icons.edit,
                      size: 24,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          Icons.keyboard_voice,
                          size: 24,
                          color: Colors.white,
                        )),
                    filled: true,
                    fillColor: Colors.black26),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  margin: EdgeInsets.all(10),
                  //padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    /*border: Border.all(
                  color: Colors.deepOrange.shade300, width: 5, style: BorderStyle.solid,

                ),*/
                    gradient: LinearGradient(
                        colors: [Colors.blueGrey, Colors.cyan.shade400]),
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(10.0)),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(5),
                  height: 50,
                  width: 100,
                  //color: Colors.orange.shade200,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        " verdiğiniz cevap : ${girilenCevap}",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  margin: EdgeInsets.all(10),
                  //padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    /*border: Border.all(
                  color: Colors.deepOrange.shade300, width: 5, style: BorderStyle.solid,

                ),*/
                    gradient: LinearGradient(
                        colors: [Colors.blueGrey, Colors.cyan.shade400]),
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(10.0)),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(5),
                  height: 50,
                  width: 100,
                  //color: Colors.orange.shade200,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.done,
                        size: 25,
                        color: Colors.white,
                      ),
                      Visibility(
                        child: Text(
                          " Doğru Cevap : ${carpim}",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        visible: durum,
                      ),
                    ],
                  )),
            )

            /*Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                color: Colors.red.shade400,
                icon: Icon(Icons.arrow_back, size: 36,),
                onPressed: (){
                  /*Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => FormIslemleri(),
                  ));*/
                  Navigator.pop(context);
                },
              ),
            )*/
          ],
        ));
  }
}
