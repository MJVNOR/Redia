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
      //backgroundColor: Colors.white,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.07,
            child: Container(
              decoration: BoxDecoration(
                //color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: AssetImage("images/fondo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
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
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 20,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Username or Email",
                              ),
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 20,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Password",
                              ),
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        RaisedButton(
                          colorBrightness: Brightness.dark,
                          color: const Color(0xff3d6573),
                          padding: EdgeInsets.all(20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: () {},
                          child: const Text('Sign In',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Flexible(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 20,
                        child: Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListTile(
                                title: Text(
                                  "Sing Up",
                                  style: TextStyle(
                                    color: const Color(0xff3d6573),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextField(
                                decoration:
                                    InputDecoration(hintText: "Username"),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(hintText: "Email"),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration:
                                    InputDecoration(hintText: "First name"),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration:
                                    InputDecoration(hintText: "Last name"),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration:
                                    InputDecoration(hintText: "Password"),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Confirm password"),
                              ),
                              SizedBox(height: 30),
                              RaisedButton(
                                colorBrightness: Brightness.dark,
                                color: const Color(0xff3d6573),
                                padding: EdgeInsets.all(20.0),
                                onPressed: () {},
                                child: const Text('Join Us',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
