import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 203, 236, 241),
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
                              Text(
                                'Olá,',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  'Entre ou se cadastre',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                onTap: () {},
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
                                onTap: () {},
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
                                onTap: () {},
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
                                onTap: () {},
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
