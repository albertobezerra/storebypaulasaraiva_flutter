import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 211, 118, 130),
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Digita aqui seu nome completo',
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
                keyboardType: TextInputType.name,
                validator: (text) {
                  if (text!.isEmpty || text.length < 12)
                    return 'Tem que digitar seu nome completo';
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Digita aqui seu e-mail',
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
                    return 'E-mail inv??lido';
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Digita aqui seu endere??o completo',
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
                keyboardType: TextInputType.streetAddress,
                validator: (text) {
                  if (text!.isEmpty || text.length < 12)
                    return 'Tem que digitar seu endere??o completo';
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite aqui uma senha de seis n??meros',
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
                    return 'Campo em branco ou senha menor que seis d??gitos';
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
                    if (_formKey.currentState!.validate()) {}
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
          )),
    );
  }
}
