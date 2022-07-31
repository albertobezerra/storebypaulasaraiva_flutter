import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storebypaulasaraiva/data/product_data.dart';

class CartProduct {
  late String cid;
  late String categoty;
  late String pid;

  late int quantity;

  late String size;

  late ProductData productData;

  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.documentID;
    categoty = document.data['category'];
    pid = document.data['pid'];
    quantity = document.data['quantity'];
    size = document.data['size'];
  }
  Map<String, dynamic> toMap() {
    return {
      'category': categoty,
      'pid': pid,
      'quantity': quantity,
      'size': size,
      'product': productData.toResumedMap()
    };
  }
}
