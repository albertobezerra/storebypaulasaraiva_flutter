import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:storebypaulasaraiva/models/cart_model.dart';
import 'package:storebypaulasaraiva/models/user_model.dart';
import 'package:storebypaulasaraiva/screens/homepage.dart';

// import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child: MaterialApp(
              title: 'Store By Paula Saraiva',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: const Color.fromARGB(255, 4, 125, 141),
              ),
              home: HomePage(),
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
