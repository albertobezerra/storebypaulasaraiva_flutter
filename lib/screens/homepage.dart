import 'package:flutter/material.dart';
import 'package:storebypaulasaraiva/tabs/home_tab.dart';
import 'package:storebypaulasaraiva/tabs/products_tab.dart';
import 'package:storebypaulasaraiva/widgets/cart_button.dart';
import 'package:storebypaulasaraiva/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 211, 118, 130),
            title: Text('Produtos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        )
      ],
    );
  }
}
