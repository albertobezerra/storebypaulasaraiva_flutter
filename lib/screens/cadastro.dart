import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:storebypaulasaraiva/models/user_model.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 211, 118, 130),
          title: Text('Cadastro'),
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
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Digita aqui seu nome completo',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 211, 118, 130)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    validator: (text) {
                      if (text!.isEmpty || text.length < 12)
                        return 'Tem que digitar seu nome completo';
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Digita aqui seu e-mail',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 211, 118, 130)),
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
                    controller: _addressController,
                    decoration: InputDecoration(
                      hintText: 'Digita aqui seu endereço completo',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 211, 118, 130)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    keyboardType: TextInputType.streetAddress,
                    validator: (text) {
                      if (text!.isEmpty || text.length < 12)
                        return 'Tem que digitar seu endereço completo';
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Digite aqui uma senha de seis números',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 211, 118, 130)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    obscureText: true,
                    validator: (text) {
                      if (text!.isEmpty || text.length < 6) {
                        return 'Campo em branco ou senha menor que seis dígitos';
                      }
                    },
                  ),
                  // SizedBox(height: 8),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text('Esqueci minha senha'),
                  //   style: TextButton.styleFrom(
                  //     alignment: Alignment.centerRight,
                  //     padding: EdgeInsets.zero,
                  //     primary: Color.fromARGB(255, 211, 118, 130),
                  //     onSurface: Colors.grey,
                  //   ),
                  // ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Map<String, dynamic> userData = {
                            'name': _nameController.text,
                            'email': _emailController.text,
                            'address': _addressController.text,
                          };
                          model.signUp(
                            userData: userData,
                            pass: _passController.text,
                            onSucess: _onSucess,
                            onFail: _onFail,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color.fromARGB(255, 211, 118, 130),
                        onSurface: Colors.grey,
                      ),
                      child: Text(
                        'Finalizar meu cadastro',
                        style: TextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  void _onSucess() {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text('Tudo certo! Vamos comprar?'),
      backgroundColor: Color.fromARGB(255, 211, 118, 130),
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text('Ixei, deu algo errado!'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ));
  }
}
