import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../homepage.dart';
import 'lojas.dart';
import 'pedidos.dart';

class Produtos extends StatelessWidget {
  const Produtos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Stack(
          children: [
            _buildDrawerBack(),
            ListView(
              padding: EdgeInsets.only(left: 32, top: 20),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'By Paula Saraiva',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Store',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor:
                                        Color.fromARGB(255, 211, 118, 130),
                                    onSurface: Colors.grey,
                                  ),
                                  child: Text('Entrar para comprar'),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.zero, //tira o espaço padrão
                                  title: Row(
                                    children: <Widget>[
                                      Icon(Icons.home),
                                      SizedBox(width: 20),
                                      Text("Início")
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    );
                                  },
                                ),
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.zero, //tira o espaço padrão
                                  title: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.list,
                                        color:
                                            Color.fromARGB(255, 211, 118, 130),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "Produtos",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 211, 118, 130),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Produtos(),
                                      ),
                                    );
                                  },
                                ),
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.zero, //tira o espaço padrão
                                  title: Row(
                                    children: <Widget>[
                                      Icon(Icons.location_pin),
                                      SizedBox(width: 20),
                                      Text("Lojas")
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lojas(),
                                      ),
                                    );
                                  },
                                ),
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.zero, //tira o espaço padrão
                                  title: Row(
                                    children: <Widget>[
                                      Icon(Icons.playlist_add_check),
                                      SizedBox(width: 20),
                                      Text("Meus pedidos")
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Pedidos(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 211, 118, 130),
      appBar: AppBar(
        elevation: 5,
        title: Text('Produtos'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 211, 118, 130),
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(Icons.menu),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection('categorias').getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: [],
            );
          }
        },
      ),
    );
  }
}

Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
