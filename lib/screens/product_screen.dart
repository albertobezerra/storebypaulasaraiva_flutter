import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:storebypaulasaraiva/data/cart_product.dart';
import 'package:storebypaulasaraiva/data/product_data.dart';
import 'package:storebypaulasaraiva/models/cart_model.dart';
import 'package:storebypaulasaraiva/models/user_model.dart';
import 'package:storebypaulasaraiva/screens/login.dart';

class ProdutcScreen extends StatefulWidget {
  final ProductData product;

  ProdutcScreen(this.product);
  @override
  State<ProdutcScreen> createState() => _ProdutcScreenState(product);
}

class _ProdutcScreenState extends State<ProdutcScreen> {
  final ProductData product;
  String? size;
  late String category;
  _ProdutcScreenState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 211, 118, 130),
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotColor: Color.fromARGB(255, 211, 118, 130),
              dotIncreasedColor: Color.fromARGB(255, 211, 118, 130),
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 211, 118, 130),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Descrição do Produto',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 16),
                Text(
                  'Tamanho',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.5,
                    ),
                    children: product.sizes.map((s) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            size = s;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                              color: Color.fromARGB(255, 211, 118, 130),
                              width: s == size ? 3 : 1,
                            ),
                          ),
                          width: 50,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromARGB(255, 211, 118, 130),
                      onSurface: Colors.grey,
                    ),
                    onPressed: size != null
                        ? () {
                            if (UserModel.of(context).isLoggedIn()) {
                              CartProduct cartProduct = CartProduct();
                              cartProduct.size = size;
                              cartProduct.quantity = 1;
                              cartProduct.pid = product.id;
                              cartProduct.category = product.category;
                              CartModel.of(context).addCartItem(cartProduct);
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            }
                          }
                        : null,
                    child: Text(
                      UserModel.of(context).isLoggedIn()
                          ? 'Adicionar ao carinho'
                          : 'Faça login para comprar',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
