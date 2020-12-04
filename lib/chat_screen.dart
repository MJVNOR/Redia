import 'package:flutter/material.dart';
import 'package:redia/constants.dart';
import 'package:redia/perfil.dart';
import 'package:redia/edit_profile.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color(0xffC9E8F2),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Redia',
            style: TextStyle(
              fontFamily: 'Myriad CAD',
              fontSize: 40,
              color: const Color(0xff3d6573),
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Material(
                elevation: 4.0,
                shape: CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: Ink.image(
                  image: NetworkImage(
                    "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                  ),
                  fit: BoxFit.cover,
                  width: 50.0,
                  height: 50.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage()),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
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
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: kMessageContainerDecoration,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) {},
                            decoration: kMessageTextFieldDecoration,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Enviar',
                            style: kSendButtonTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
