import 'package:flutter/material.dart';

import 'menu.dart';

class FormVeTextFormFieldState extends StatefulWidget {
  @override
  _FormVeTextFormFieldStateState createState() =>
      _FormVeTextFormFieldStateState();
}

class _FormVeTextFormFieldStateState extends State<FormVeTextFormFieldState> {
  String _adSoyad, _emailAdres, _sifre;
  bool otomatikKontrol = false;
  final formKey = GlobalKey<FormState>();
  String secilenSinif="1.Sınıf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Bilgileri"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          autovalidate: otomatikKontrol,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 24,
                      color: Colors.white,
                    ),
                    hintText: "Adınız ve Soyadınız",
                    hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    labelText: "Ad Soyad",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 3,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.blueGrey.shade200,
                          width: 3,
                        ))),
                validator: _isimKontrol,
                onSaved: (deger) => _adSoyad = deger,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      size: 24,
                      color: Colors.white,
                    ),
                    hintText: "E-mail Adresiniz",
                    hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    labelText: "E-mail",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 3,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.blueGrey.shade200,
                          width: 3,
                        ))),
                validator: _emailKontrol,
                onSaved: (deger) => _emailAdres = deger,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 24,
                      color: Colors.white,
                    ),
                    hintText: "Şİfreniz",
                    hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                    labelText: "Şifre",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 3,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.blueGrey.shade200,
                          width: 3,
                        ))),
                validator: (String girilenVeri) {
                  if (girilenVeri.length < 6) {
                    return "6 karakterden az karakter girdiniz";
                  } else
                    return null;
                },
                onSaved: (deger) => _sifre = deger,
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.person, size: 20),
                        Text("1.Sınıf",style: TextStyle(fontSize: 17),),
                      ],
                    ),
                    value: "1.Sınıf",
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.person, size: 20),
                        Text("2.Sınıf",style: TextStyle(fontSize: 17),),
                      ],
                    ),
                    value: "2.Sınıf",
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.person, size: 20),
                        Text("3.Sınıf",style: TextStyle(fontSize: 17),),
                      ],
                    ),
                    value: "3.Sınıf",
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.person, size: 20),
                        Text("4.Sınıf",style: TextStyle(fontSize: 17),),
                      ],
                    ),
                    value: "4.Sınıf",
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.person, size: 20),
                        Text("5.Sınıf",style: TextStyle(fontSize: 17),),
                      ],
                    ),
                    value: "5.Sınıf",
                  ),
                ],
                onChanged: (String secilen) {
                  setState(() {
                    secilenSinif =secilen;
                  });
                },
                hint: Text("Seçiniz"),
                value: secilenSinif,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton.icon(
                      icon: Icon(
                        Icons.save_alt,
                        size: 24,
                        color: Colors.white,
                      ),
                      label: Text(
                        "KAYDET",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      color: Colors.blueGrey,
                      disabledColor: Colors.amber,
                      onPressed: _girisBilgileriniOnayla),
                  RaisedButton.icon(
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 24,
                      color: Colors.white,
                    ),
                    label: Text(
                      "DEVAM ET",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    color: Colors.blueGrey,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenuIslemleri()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _girisBilgileriniOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint(
          "Girilen ad soyad: $_adSoyad mail: $_emailAdres şifre: $_sifre sinif: $secilenSinif");
    } else {
      setState(() {
        otomatikKontrol = true;
      });
    }
  }

  String _emailKontrol(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Geçersiz bir mail';
    else
      return null;
  }

  String _isimKontrol(String isim) {
    RegExp regex = RegExp("^[a-zA-Z]+\$");
    if (!regex.hasMatch(isim))
      return "rakam ya da boşluk girdiniz";
    else
      return null;
  }
}
