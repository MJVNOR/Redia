import 'dart:html';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:redia/core/presentation/res/assets.dart' as assets;
import 'package:redia/src/widgets/network_image.dart';
import 'package:redia/perfil.dart';
import 'package:redia/catalogo.dart';

class TimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onTap: () {},
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
          Padding(
            padding: EdgeInsets.only(left: 250.0, right: 250.0, bottom: 30.0),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 50,
                              minHeight: 50,
                              maxWidth: 50,
                              maxHeight: 50,
                            ),
                            child: Material(
                              elevation: 4.0,
                              shape: CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              color: Colors.transparent,
                              child: Ink.image(
                                image: NetworkImage(assets.avatar),
                                fit: BoxFit.cover,
                                width: 50.0,
                                height: 50.0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Perfil()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          title: const Text('Taqueria Lcc'),
                          subtitle: Text(
                            '4:30pm',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Ricos tacos',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            FlatButton(
                              textColor: const Color(0xFF6200EE),
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('Like'),
                            ),
                            FlatButton(
                              textColor: const Color(0xFF6200EE),
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('Comment'),
                            ),
                          ],
                        ),
                        PNetworkImage(assets.posts[0], fit: BoxFit.cover),
                      ],
                    ),
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
