import 'package:flutter/material.dart';

import 'form_islemleri.dart';
import 'kisi_bilgileri.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.cyan.shade700,
      brightness: Brightness.dark,
      errorColor: Colors.cyanAccent
    ),
    home: FormVeTextFormFieldState(),

  ));
}

/*class Sayfa1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SAYFA1"),
        ),
        body: Center(
          child: RaisedButton(
            color: Colors.purple,
            child: Text("Sayfa 2ye git",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Sayfa2(),
              ));
            },
          ),
        )
    );
  }
}

class Sayfa2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SAYFA2", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.pink,
                  child: Text("Geri Dön", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(
                  color: Colors.cyan,
                  child: Text("Sayfa 3 e Git", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Sayfa3(),
                    ));
                  },
                )
              ],
            ),
        )
    );
  }
}

class Sayfa3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SAYFA3"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.orange,
          child: Text("Geri Dön", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
*/

