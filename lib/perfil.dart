import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:redia/core/presentation/res/assets.dart' as assets;
import 'package:redia/src/widgets/network_image.dart';
import 'package:redia/catalogo.dart';
import 'package:redia/chat_screen.dart';
import 'package:redia/edit_profile.dart';

class Perfil extends StatelessWidget {
  static final String path = "lib/src/perfil.dart";
  final List<Map> catalogo = [
    {
      "title": "Tacos de asada",
      "image": assets.catalogo[0],
    },
    {
      "title": "Costillas",
      "image": assets.catalogo[1],
    },
    {
      "title": "Quesadillas",
      "image": assets.catalogo[2],
    },
    {
      "title": "Aguas frescas",
      "image": assets.catalogo[3],
    },
    {
      "title": "Tacos de asada",
      "image": assets.catalogo[0],
    },
    {
      "title": "Costillas",
      "image": assets.catalogo[1],
    },
    {
      "title": "Quesadillas",
      "image": assets.catalogo[2],
    },
    {
      "title": "Aguas frescas",
      "image": assets.catalogo[3],
    },
    {
      "title": "Tacos de asada",
      "image": assets.catalogo[0],
    },
    {
      "title": "Costillas",
      "image": assets.catalogo[1],
    },
    {
      "title": "Quesadillas",
      "image": assets.catalogo[2],
    },
    {
      "title": "Aguas frescas",
      "image": assets.catalogo[3],
    },
  ];
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
        children: <Widget>[
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
          ListView.builder(
            itemCount: 7,
            itemBuilder: _mainListBuilder,
          ),
        ],
      ),
    );
  }

  Widget _mainListBuilder(BuildContext context, int index) {
    if (index == 0) return _buildHeader(context);
    if (index == 1) return _buildSectionHeader(context);
    if (index == 2) return _buildCollectionsRow();
    if (index == 3)
      return Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
        child: Text("Publicaciones", style: Theme.of(context).textTheme.title),
      );
    return _buildListItem();
  }

  Widget _buildListItem() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                  ),
                ),
              ),
              title: const Text('Taqueria Lcc'),
              subtitle: Text(
                '4:30pm',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
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
    );
  }

  Container _buildSectionHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Catálogo",
            style: Theme.of(context).textTheme.title,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Catalogo()),
              );
            },
            child: Text(
              "Ver catálogo",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  Container _buildCollectionsRow() {
    return Container(
      color: Colors.white,
      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: catalogo.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              width: 150.0,
              height: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: PNetworkImage(catalogo[index]['image'],
                              fit: BoxFit.cover))),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(catalogo[index]['title'],
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .merge(TextStyle(color: Colors.grey.shade600)))
                ],
              ));
        },
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 240.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Taquería LCC",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("Comida mexicana"),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "3",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Publicaciones".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0)),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "2020",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Seguidores".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0)),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen()),
                                );
                              },
                              child: Icon(
                                Icons.chat,
                                color: Colors.blue,
                                size: 24.0,
                              ),
                            ),
                            subtitle: Text("Enviar mensaje".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.blue,
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(assets.avatar),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
