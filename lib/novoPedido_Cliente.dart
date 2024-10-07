import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/clientes.dart';
import 'package:flutter_application_1/estoque.dart';
import 'package:flutter_application_1/fornecedor.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/novoPedido_Produto.dart';
import 'package:flutter_application_1/pedidos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NovoPedido_Cliente extends StatefulWidget {
  const NovoPedido_Cliente({super.key});

  @override
  State<NovoPedido_Cliente> createState() => _NovoPedido_ClienteState();
}

class _NovoPedido_ClienteState extends State<NovoPedido_Cliente> {
  final _formKey_Pedidos_Cliente = GlobalKey<FormState>();
  final _inputNome_Cliente = TextEditingController();
  final _inputCEP_Cliente = TextEditingController();
  final _inputNumeroCasa_Cliente = TextEditingController();
  final _inputEndereco_Cliente = TextEditingController();
  final _inputBairro_Cliente = TextEditingController();
  final _inputCidade_Cliente = TextEditingController();
  final _inputComplemento_Cliente = TextEditingController();
  final _inputContato_Cliente = TextEditingController();
  void buscaCEP() async {
    String cep = _inputCEP_Cliente.text;

    if (cep.length < 8) return; // Evita busca se o CEP não tiver 8 caracteres.

    String url = "https://viacep.com.br/ws/$cep/json/";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> dados = json.decode(response.body);
        setState(() {
          _inputEndereco_Cliente.text = dados["logradouro"] ?? '';
          _inputBairro_Cliente.text = dados["bairro"] ?? '';
          _inputCidade_Cliente.text = dados["localidade"] ?? '';
        });
      } else {
        print("Erro ao buscar CEP: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao buscar CEP: $e");
    }
  }

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
          backgroundColor: Colors.grey[200],
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Colors.yellow,
              leading: GestureDetector(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
              ),
              automaticallyImplyLeading: false,
              title: Text(
                "NOVO PEDIDO",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              iconTheme: IconThemeData(size: 40),
              centerTitle: true,
              toolbarHeight: 100,
            ),
          ),
          endDrawer: Drawer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.black),
                    accountName: Text("Seja Bem-Vindo!"),
                    accountEmail: Text("EmaildoUsuario@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      "Início",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Pedidos",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Pedidos()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Estoque",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Estoque()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Clientes",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Clientes()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Fornecedores",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Fornecedor()));
                    },
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  ListTile(
                    title: Text(
                      "Sair",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.of(
                        context,
                      ).popUntil((route) => route.isFirst);
                    },
                  )
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Dados do Cliente",
                    style: TextStyle(fontSize: 25),
                  ),
                  Form(
                    key: _formKey_Pedidos_Cliente,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório";
                              } else if (RegExp(r'[0-9]').hasMatch(value)) {
                                return "Este campo não permite números";
                              } else if (int.tryParse(value) == null) {
                                return null;
                              } else {
                                return "Formato inválido";
                              }
                            },
                            controller: _inputNome_Cliente,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Nome",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (value) {
                                    buscaCEP();
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(8)
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Campo obrigatório";
                                    } else if (int.tryParse(value) == null) {
                                      return "Só aceita números";
                                    } else if (value.length < 8) {
                                      return "Caracteres mínimos: 8";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _inputCEP_Cliente,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "CEP",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(5)
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Campo obrigatório";
                                    } else if (int.tryParse(value) == null) {
                                      return "Só aceita números";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _inputNumeroCasa_Cliente,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Número",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório";
                              } else if (RegExp(r'[0-9]').hasMatch(value)) {
                                return "Este campo não permite números";
                              } else if (int.tryParse(value) == null) {
                                return null;
                              } else {
                                return "Formato inválido";
                              }
                            },
                            controller: _inputEndereco_Cliente,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Endereço",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório";
                              } else if (RegExp(r'[0-9]').hasMatch(value)) {
                                return "Este campo não permite números";
                              } else if (int.tryParse(value) == null) {
                                return null;
                              } else {
                                return "Formato inválido";
                              }
                            },
                            controller: _inputBairro_Cliente,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Bairro",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório";
                              } else if (RegExp(r'[0-9]').hasMatch(value)) {
                                return "Este campo não permite números";
                              } else if (int.tryParse(value) == null) {
                                return null;
                              } else {
                                return "Formato inválido";
                              }
                            },
                            controller: _inputCidade_Cliente,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Cidade",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null) {
                                return null;
                              } else if (int.tryParse(value) == null) {
                                return null;
                              } else {
                                return "Formato inválido";
                              }
                            },
                            controller: _inputComplemento_Cliente,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Complemento",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(11)
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório";
                              } else if (int.tryParse(value) == null) {
                                return "Só aceita números";
                              } else if (value.length < 11) {
                                return "Caracteres mínimos: 11";
                              } else {
                                return null;
                              }
                            },
                            controller: _inputContato_Cliente,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Contato",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, top: 30, bottom: 30),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey_Pedidos_Cliente.currentState!
                                    .validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NovoPedido_Produto()));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                "Enviar",
                                style: TextStyle(
                                  color: Color(0xFF000000),
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
