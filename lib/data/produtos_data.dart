import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutosData {
  late String categoria;
  late String id;
  late String titulo;
  late String descricao;
  late double preco;
  late List images;
  late List tamanho;

  ProdutosData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    titulo = snapshot.data['titulo'];
    descricao = snapshot.data['descricao'];
    preco = snapshot.data['preco'] + 0.0;
    images = snapshot.data['images'];
    tamanho = snapshot.data['tamanho'];
  }
}
