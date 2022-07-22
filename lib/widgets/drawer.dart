import 'package:flutter/material.dart';
import 'package:storebypaulasaraiva/screens/login.dart';
import 'package:storebypaulasaraiva/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);

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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 211, 118, 130),
                              onSurface: Colors.grey,
                            ),
                            child: Text('Entrar para comprar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              DrawerTile(Icons.home, 'Novidades', pageController, 0),
              DrawerTile(Icons.list, 'Produtos', pageController, 1),
              DrawerTile(
                  Icons.playlist_add_check, 'Meus Pedidos', pageController, 2),
              DrawerTile(Icons.location_on, 'Lojas', pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
