import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:storebypaulasaraiva/models/user_model.dart';
import 'package:storebypaulasaraiva/screens/login.dart';
import 'package:storebypaulasaraiva/tiles/drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
            padding: EdgeInsets.only(left: 32, top: 16),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 0,
                      child: Text(
                        'By Paula Saraiva',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Positioned(
                      top: 45,
                      left: 0,
                      child: Text(
                        'Store',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 18),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Olá, ${!model.isLoggedIn() ? '' : model.userData['name']}'),
                              TextButton(
                                onPressed: () {
                                  if (!model.isLoggedIn()) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  } else {
                                    model.singOut();
                                  }
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 211, 118, 130),
                                  onSurface: Colors.grey,
                                ),
                                child: Text(!model.isLoggedIn()
                                    ? 'Entrar para comprar'
                                    : 'Sair'),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              DrawerTile(Icons.home, 'Novidades', widget.pageController, 0),
              DrawerTile(Icons.list, 'Produtos', widget.pageController, 1),
              DrawerTile(Icons.playlist_add_check, 'Meus Pedidos',
                  widget.pageController, 2),
              DrawerTile(Icons.location_on, 'Lojas', widget.pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
