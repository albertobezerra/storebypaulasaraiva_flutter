import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 211, 118, 130),
                Color.fromARGB(255, 253, 181, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 5,
              backgroundColor: Color.fromARGB(255, 211, 118, 130),
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Novidades'),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection('novidades')
                  .orderBy('pos')
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                } else {
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    staggeredTiles: snapshot.data!.documents.map((doc) {
                      return StaggeredTile.count(doc.data['x'], doc.data['y']);
                    }).toList(),
                    children: snapshot.data!.documents.map(
                      (doc) {
                        return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: doc.data['image'],
                          fit: BoxFit.cover,
                        );
                      },
                    ).toList(),
                  );
                }
              },
            )
          ],
        )
      ],
    );
  }
}
