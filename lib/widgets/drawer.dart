import 'package:flutter/material.dart';
import 'package:storebypaulasaraiva/paginas/lojas.dart';
import 'package:storebypaulasaraiva/paginas/pedidos.dart';
import 'package:storebypaulasaraiva/paginas/produtos.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Drawer(
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
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Store',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
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
                        SizedBox(height: 30),
                        Expanded(
                          child: ListView(
                            children: <Widget>[
                              ListTile(
                                contentPadding:
                                    EdgeInsets.zero, //tira o espaço padrão
                                title: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.home,
                                      color: Color.fromARGB(255, 211, 118, 130),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      "Início",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 211, 118, 130),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                              ListTile(
                                contentPadding:
                                    EdgeInsets.zero, //tira o espaço padrão
                                title: Row(
                                  children: <Widget>[
                                    Icon(Icons.list),
                                    SizedBox(width: 20),
                                    Text("Produtos")
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
          )
        ],
      ),
    );
  }
}
