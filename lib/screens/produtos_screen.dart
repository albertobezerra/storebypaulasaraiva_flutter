import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:storebypaulasaraiva/data/produtos_data.dart';

import '../tiles/produtos_tile.dart';

class ProdutosScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;
  ProdutosScreen(this.snapshot);
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
                .collection('produtos')
                .document(snapshot.documentID)
                .collection('Tipos')
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
                        mainAxisExtent: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: snapshot.data!.documents.length,
                      itemBuilder: (context, index) {
                        return ProdutosTile(
                            'grid',
                            ProdutosData.fromDocument(
                                snapshot.data!.documents[index]));
                      },
                    ),
                    ListView.builder(
                      padding: EdgeInsets.all(4),
                      itemCount: snapshot.data!.documents.length,
                      itemBuilder: (context, index) {
                        return ProdutosTile(
                            'lista',
                            ProdutosData.fromDocument(
                                snapshot.data!.documents[index]));
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
