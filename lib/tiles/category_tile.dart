import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTiles extends StatelessWidget {
  final DocumentSnapshot snapshot;
  CategoryTiles(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data['img']),
      ),
      title: Text(snapshot.data['title']),
      trailing: Icon(Icons.keyboard_arrow_right,
          color: Color.fromARGB(255, 211, 118, 130)),
      onTap: () {},
    );
  }
}
