import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:storebypaulasaraiva/tiles/category_tile.dart';

class ProdutosTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection('produtos').getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          );
        } else {
          var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data!.documents.map((doc) {
                    return CategoryTiles(doc);
                  }).toList(),
                  color: Color.fromARGB(255, 211, 118, 130))
              .toList();
          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }
}
