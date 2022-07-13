import 'package:flutter/material.dart';
import 'package:storebypaulasaraiva/tabs/home_tabs.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const HomeTab(),
      ],
    );
  }
}
