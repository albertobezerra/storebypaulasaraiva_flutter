import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 211, 118, 130),
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
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
                onPressed: () {},
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
              )
            ],
          )),
    );
  }
}
