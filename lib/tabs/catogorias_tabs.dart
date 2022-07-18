import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data['url']),
      ),
      title: Text(snapshot.data['title']),
      trailing: Icon(Icons.keyboard_arrow_right,
          color: Color.fromARGB(255, 211, 118, 130)),
      onTap: () {},
    );
  }
}
