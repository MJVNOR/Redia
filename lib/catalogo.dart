import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:redia/core/presentation/res/assets.dart' as assets;
import 'package:redia/src/widgets/network_image.dart';

class Catalogo extends StatelessWidget {
  static final String path = "lib/src/catalogo.dart";

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
  ];

  final List<Map> precios = [
    {"title": "\$35"},
    {"title": "\$60"},
    {"title": "\$25"},
    {"title": "\$15"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Taquería LCC'),
              background: PNetworkImage(assets.posts[0], fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                color: const Color(0xff3d6573),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // ignore: missing_required_param
                      MaterialButton(
                        //onPressed: () {},
                        child: Text(
                          "Catálogo".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          
          SliverPadding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                  crossAxisCount: 3),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildItems(index, context);
                },
                childCount: catalogo.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      height: 200.0,
      child: Container(
        child: Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return new PNetworkImage(
              catalogo[index]['image'],
              fit: BoxFit.cover,
            );
          },
          itemCount: 4,
          pagination: new SwiperPagination(),
        ),
      ),
    );
  }

  Widget _buildItems(int index, BuildContext context) {
    return Container(
      height: 200,
      child: GestureDetector(
        onTap: () => _onTapItem(context, index),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Hero(
                    tag: "item$index",
                    child: PNetworkImage(catalogo[index]['image'],
                        fit: BoxFit.cover))),
            SizedBox(
              height: 10.0,
            ),
            Text(
              catalogo[index]['title'],
              softWrap: true,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              precios[index]['title'],
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Container(
        height: 100,
        child: Card(
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(catalogo[index]['image']),
              ),
              title: Text(
                catalogo[index]['title'],
                softWrap: true,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              subtitle: Text(
                precios[index]['title'],
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ),
        ));
  }

  _onTapItem(BuildContext pcontext, int index) {
    Navigator.of(pcontext)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Vista del producto'),
        ),
        body: Material(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Center(
                    child: Hero(
                        tag: "item$index",
                        child: PNetworkImage(catalogo[index]['image'],
                            fit: BoxFit.cover)),
                  )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    catalogo[index]['title'],
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    precios[index]['title'],
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
