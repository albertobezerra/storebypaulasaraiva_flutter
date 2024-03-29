import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:storebypaulasaraiva/models/user_model.dart';

import 'cadastro.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 211, 118, 130),
        title: Text('Login'),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 211, 118, 130)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text!.isEmpty || !text.contains('@'))
                      return 'E-mail inválido';
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 211, 118, 130)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  obscureText: true,
                  validator: (text) {
                    if (text!.isEmpty || text.length < 6) {
                      return 'Senha inválida';
                    }
                  },
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    if (_emailController.text.isEmpty) {
                      _scaffoldKey.currentState?.showSnackBar(SnackBar(
                        content: Text('Insira o email para recuperar a senha!'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ));
                    } else {
                      model.recoverPass(_emailController.text);
                      _scaffoldKey.currentState?.showSnackBar(SnackBar(
                        content:
                            Text('Enviamos um emal para recuperar a senha!'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  child: Text('Esqueci minha senha'),
                  style: TextButton.styleFrom(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.zero,
                    primary: Color.fromARGB(255, 211, 118, 130),
                    onSurface: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      model.signIn(
                        email: _emailController.text,
                        pass: _passController.text,
                        onSucess: _onSucess,
                        onFail: _onFail,
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color.fromARGB(255, 211, 118, 130),
                      onSurface: Colors.grey,
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'Ainda não tem seu cadastro?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Cadastro()));
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color.fromARGB(255, 211, 118, 130),
                        onSurface: Colors.grey,
                      ),
                      child: Text('Clique aqui para se cadastrar!')),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSucess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text('Erro no login'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ));
  }
}
