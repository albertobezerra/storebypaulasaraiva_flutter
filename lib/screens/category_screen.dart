import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:storebypaulasaraiva/data/product_data.dart';

import '../tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;
  CategoryScreen(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 4,
            backgroundColor: Color.fromARGB(255, 211, 118, 130),
            title: Text(snapshot.data['title']),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(
                  icon: Icon(Icons.list),
                )
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection('products')
                .document(snapshot.documentID)
                .collection('items')
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 211, 118, 130),
                    ),
                  ),
                );
              } else {
                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        crossAxisSpacing: 2,
                        childAspectRatio: 0.1,
                      ),
                      itemCount: snapshot.data!.documents.length,
                      itemBuilder: (context, index) {
                        ProductData data = ProductData.fromDocument(
                          snapshot.data!.documents[index],
                        );
                        return ProductTile('grid', data);
                      },
                    ),
                    ListView.builder(
                      padding: EdgeInsets.all(1),
                      itemCount: snapshot.data!.documents.length,
                      itemBuilder: (context, index) {
                        ProductData data = ProductData.fromDocument(
                          snapshot.data!.documents[index],
                        );
                        return ProductTile('lista', data);
                      },
                    )
                  ],
                );
              }
            },
          )),
    );
  }
}
