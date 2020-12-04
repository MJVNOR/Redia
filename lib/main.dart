import 'package:flutter/material.dart';
import 'package:redia/perfil.dart';
import 'package:redia/catalogo.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      //home: Perfil(),
      //home: Catalogo(),
      theme: ThemeData(
        primaryColor: const Color(0xff9fb7bf),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white
          )
        )
      ),
    ),
  );
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Row(children: [
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a search term'),
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a search term'),
          ), //Textfield
          Expanded(
            child: RaisedButton(
              child: Text("boton 1"),
              onPressed: () {
                // something
              }, //OnPressed
            ), //RaisedButton
          ), // Expanded
        ]), //Row
      ), //appbar

      body: Opacity(
        opacity: 0.5,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
                image: AssetImage("images/fondo.jpg"), fit: BoxFit.cover),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Redia',
                    style: TextStyle(
                      fontFamily: 'Myriad CAD',
                      fontSize: 153,
                      color: const Color(0xff3d6573),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Fell the need to search',
                    style: TextStyle(
                      fontFamily: 'Myriad CAD',
                      fontSize: 37,
                      color: const Color(0xffdde4e6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Card(
                    elevation: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
