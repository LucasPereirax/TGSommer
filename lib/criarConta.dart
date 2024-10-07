import 'package:flutter/material.dart';
import 'package:flutter_application_1/termosCondicoes.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({super.key});

  @override
  State<CriarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  final _formKey_CriarConta = GlobalKey<FormState>();
  final _inputEmail_CriarConta = TextEditingController();
  final _inputSenha_CriarConta = TextEditingController();
  final _input_ConfirmarSenha_CriarConta = TextEditingController();
  bool _aceitouTermos = false;
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool _termosErro = false;

  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          if (lastPressed == null ||
              now.difference(lastPressed!) > Duration(seconds: 2)) {
            lastPressed = now;

            return false;
          }
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Form(
                    key: _formKey_CriarConta,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 300,
                          height: 300,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor, preencha o campo e-mail";
                              } else if (!value.contains('@')) {
                                return 'O e-mail precisa conter "@"';
                              }
                              return null;
                            },
                            controller: _inputEmail_CriarConta,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Informe seu e-mail",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellow),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 2.5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: TextFormField(
                            validator: (valueSenha) {
                              if (valueSenha == null || valueSenha.isEmpty) {
                                return "Por favor, preencha o campo senha";
                              } else {
                                return null;
                              }
                            },
                            obscureText: _obscureText,
                            controller: _inputSenha_CriarConta,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Informe uma senha",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellow),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 2.5),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Este campo é obrigatório";
                              } else if (value != _inputSenha_CriarConta.text) {
                                return "As senhas não coincidem";
                              } else {
                                return null;
                              }
                            },
                            obscureText: _obscureText2,
                            controller: _input_ConfirmarSenha_CriarConta,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Confirme sua senha",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellow),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 2.5),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText2 = !_obscureText2;
                                  });
                                },
                                child: Icon(
                                  _obscureText2
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _aceitouTermos,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        _aceitouTermos = newValue ?? false;
                                        _termosErro = false;
                                      });
                                    },
                                    activeColor: Color(0xFFFFFF00),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TermosCondicoes(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Li e concordo com os termos de uso",
                                      style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (_termosErro)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Você deve aceitar os termos de uso.",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey_CriarConta.currentState!
                                    .validate()) {
                                  if (_aceitouTermos) {
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                  } else {
                                    setState(() {
                                      _termosErro = true;
                                    });
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFFFF00),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                "Confirmar",
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, top: 30),
                          child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: Color(0xFFFFFF00), width: 2.0),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                "Voltar",
                                style: TextStyle(
                                  color: Color(0xFFFFFF00),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
