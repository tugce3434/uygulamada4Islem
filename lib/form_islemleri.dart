import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medium_navigasyon/bolme_islemi.dart';
import 'package:medium_navigasyon/carpma_islemi.dart';
import 'package:medium_navigasyon/cikarma_islemi.dart';
import 'package:medium_navigasyon/toplama_islemi.dart';
import 'package:medium_navigasyon/yeni_bolme.dart';
import 'package:medium_navigasyon/yeni_carpma.dart';
import 'package:medium_navigasyon/yeni_cikarma.dart';
import 'package:medium_navigasyon/yeni_toplam.dart';

class FormIslemleri extends StatefulWidget {
  @override
  _FormIslemleriState createState() => _FormIslemleriState();
}

class _FormIslemleriState extends State<FormIslemleri> {
  double sliderDeger = 10;
  double sliderDeger2 = 5;

  String girilenMetin = "";
  FocusNode _fNode;
  int mLine = 1;
  TextEditingController textController1;

  @override
  void initState() {
    super.initState();
    _fNode = FocusNode();
    textController1 = TextEditingController();

    _fNode.addListener(() {
      setState(() {
        if (_fNode.hasFocus) {
          mLine = 2;
        } else {
          mLine = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _fNode.dispose();
    super.dispose();
    textController1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "UYGULAMADA 4 İŞLEM",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(_fNode);
          debugPrint(textController1.text.toString());
        },
        child: Icon(Icons.edit), mini: true,
        backgroundColor: Colors.grey,

    ),*/
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.cyan.shade900,
            margin: EdgeInsets.all(2),
            width: 500,
            height: 40,
            //color: Colors.red.shade300,
            /*decoration: BoxDecoration(
              color: Colors.pink.shade100,
              border: Border.all(color: Colors.red.shade300, width: 4),
              borderRadius: new BorderRadius.all(
                new Radius.circular(10.0),
              ),
            ),*/
            // margin: EdgeInsets.all(10),
            // width: double.infinity,
            // height: 50,
            child: Text(
              "Zorluk Sınırını Belirleyiniz",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Slider(
            value: sliderDeger2,
            onChanged: (yeniDeger2) {
              setState(() {
                sliderDeger2 = yeniDeger2;
              });
            },
            min: 5,
            max: 100,
            divisions: 5,
            label: sliderDeger2.toString(),
            activeColor: Colors.red,
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.cyan.shade900,
            margin: EdgeInsets.all(2),
            width: 500,
            height: 40,
            //color: Colors.red.shade300,
            /*decoration: BoxDecoration(
              color: Colors.pink.shade100,
              border: Border.all(color: Colors.red.shade300, width: 4),
              borderRadius: new BorderRadius.all(
                new Radius.circular(10.0),
              ),
            ),*/
            // margin: EdgeInsets.all(10),
            // width: double.infinity,
            // height: 50,

            child: Text(
              "İşlem Yapmak İstediğiniz Basamak Sayısını Belirleyiniz.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,

              /*klavyeden sadece numaraların açılmasını istiyorsak;*/
              //keyboardType: TextInputType.number,

              /*bir veri girildikten sonra o klavyedeki ana butonun ana iconun
               ne iş yapması gerektiğini;*/
              textInputAction: TextInputAction.done,

              /*maxLines:3 dersek ekranda 3 satırlık bir alan verir bize*/

              autofocus: false,
              maxLines: mLine,
              focusNode: _fNode,
              controller: textController1,

              /*sınırlandırabileceğimiz karakter boyutunu
               mesela kullanıcı 26 karakterden fazla bir şey girmesin diye*/

              maxLength: 20,
              maxLengthEnforced: true,

              onChanged: (String s) => debugPrint("on changed: $s"),
              onSubmitted: (String s) {
                debugPrint("on submitted : $s");
                girilenMetin = s;
              },
              cursorColor: Colors.white,

              //focusNode: _focusNode,

              decoration: InputDecoration(
                  hintText: "Belirlediğiniz basamak sayısını giriniz",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400),
                  labelText: "Cevap Alanı",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 3,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 3,
                      )),
                  /* icon: Icon(
                    Icons.edit,
                    size: 24,
                    color: Colors.red,
                  ),*/
                  prefixIcon: Icon(
                    Icons.edit,
                    size: 26,
                    color: Colors.red,
                  ),
                  suffixIcon: IconButton(
                      icon: IconButton(
                    icon: Icon(Icons.keyboard_voice),
                    onPressed: () {},
                    color: Colors.red,
                  )),
                  filled: true,
                  fillColor: Colors.black26),

              // buna false dersek
              // maxLength e koymuş olduğumuz bir sınırın önemi kalmayacak

              /*geriye metod verir onChanged*/
              /*onSubmitted ile fark
               biri klavyeye her basıldığında tetiklenirken(onChanged)
               diğeri (onSubmitted) inputExtion dediğimiz buton
               tetiklendiğinde olacak işlemleri belirtiyor*/

              //emulatorde her bir rakama bastığımızda onChanged
              // tetikleniyor, rakamları yazdıktan sonra
              // tik e bastığımızda on Submitted tetikleniyor
              /*her değer girdiğimizde merhaba flutter yazısını
              güncellemek değiştirmek isitiyorsak*/

              /*onChanged: (String s) => debugPrint("On Change : $s"),
              onSubmitted: (String s) {
                debugPrint("On Submitted : $s");
                girilenMetin = s;
              },*/
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.cyan.shade900,
            margin: EdgeInsets.all(2),
            width: 500,
            height: 40,

            //color: Colors.red.shade300,
            /*decoration: BoxDecoration(
              color: Colors.pink.shade100,
              border: Border.all(color: Colors.red.shade300, width: 4),
              borderRadius: new BorderRadius.all(
                new Radius.circular(10.0),
              ),
            ),*/
            // margin: EdgeInsets.all(10),
            // width: double.infinity,
            // height: 50,
            child: Text(
              "İşlem Süresini Belirleyiniz.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Slider(
            value: sliderDeger,
            onChanged: (yeniDeger) {
              setState(() {
                sliderDeger = yeniDeger;
              });
            },
            min: 10,
            max: 100,
            divisions: 10,
            label: sliderDeger.toString(),
            activeColor: Colors.red,
          ),
          SizedBox(
            height: 2,
          ),
          Center(
            child: Container(
              child: RaisedButton.icon(
                label: Text(
                  "KAYDET",
                  style: TextStyle(fontSize: 20),
                ),
                icon: Icon(
                  Icons.save_alt,
                  size: 24,
                  color: Colors.white,
                ),
                color: Colors.red,
                onPressed: () {
                  debugPrint("Zorluk Sınırı: " + sliderDeger2.toString());
                  debugPrint(
                      "Girilen Değer: " + textController1.text.toString());
                  debugPrint("İşlem Süresi: " + sliderDeger.toString());
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.cyan.shade900,
            margin: EdgeInsets.all(2),
            width: 500,
            height: 40,
            child: Text(
              "İşlem Türünü Belirleyiniz.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: new BorderRadius.all(
                      new Radius.circular(20.0),
                    ),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(
                      Icons.add,
                      size: 25,
                    ),
                    onPressed: () {
                      debugPrint("İşlem türü 'toplama' olarak belirlendi");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ToplamaIslemiSayfasi(),
                          ));
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: new BorderRadius.all(
                      new Radius.circular(20.0),
                    ),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(
                      Icons.remove,
                      size: 25,
                    ),
                    onPressed: () {
                      debugPrint("İşlem türü 'çıkarma' olarak belirlendi");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>CikarmaIslemiSayfasi(),
                          ));
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: new BorderRadius.all(
                      new Radius.circular(20.0),
                    ),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(
                      Icons.close,
                      size: 25,
                    ),
                    onPressed: () {
                      debugPrint("İşlem türü 'çarpma' olarak belirlendi");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarpmaIslemiSayfasi(),
                          ));
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade300,
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: new BorderRadius.all(
                      new Radius.circular(20.0),
                    ),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(
                      Icons.vertical_align_center,
                      size: 25,
                    ),
                    onPressed: () {
                      debugPrint("İşlem türü 'bölme' olarak belirlendi");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BolmeIslemiSayfasi(),
                          ));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
