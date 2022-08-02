import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:storebypaulasaraiva/models/cart_model.dart';
import 'package:storebypaulasaraiva/models/user_model.dart';
import 'package:storebypaulasaraiva/screens/login.dart';
import 'package:storebypaulasaraiva/tiles/cart_tiles.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu carinho'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                int p = model.products.length;
                return Text(
                  '${p} ${p == 1 ? 'ITEM' : 'ITENS'}',
                );
              },
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn()) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!UserModel.of(context).isLoggedIn()) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart,
                    size: 80,
                    color: Color.fromARGB(255, 211, 118, 130),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Faça o login para adicionar produtos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Entrar',
                    ),
                    style: TextButton.styleFrom(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.zero,
                      primary: Color.fromARGB(255, 211, 118, 130),
                      onSurface: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          } else if (model.products == null || model.products.length == 0) {
            return Center(
              child: Text('Nenhum produto no carrinho'),
            );
          } else {
            return ListView(
              children: [
                Column(
                  children: model.products.map((product) {
                    return CartTile(product);
                  }).toList(),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
