import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/clientes.dart';
import 'package:flutter_application_1/estoque.dart';
import 'package:flutter_application_1/fornecedor.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/pedidos.dart';

class NovoItem_Estoque extends StatefulWidget {
  const NovoItem_Estoque({super.key});

  @override
  State<NovoItem_Estoque> createState() => _NovoItem_EstoqueState();
}

class _NovoItem_EstoqueState extends State<NovoItem_Estoque> {
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    final _formKey_NovoItem_Estoque = GlobalKey<FormState>();
    final _inputDescricao_Estoque = TextEditingController();
    final _inputCategoria_Estoque = TextEditingController();
    final _inputQuantidadeInicial_Estoque = TextEditingController();
    final _inputQuantidadeMinima_Estoque = TextEditingController();

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
                "ESTOQUE",
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
                    "Novo item",
                    style: TextStyle(fontSize: 25),
                  ),
                  Form(
                    key: _formKey_NovoItem_Estoque,
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
                            controller: _inputDescricao_Estoque,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Descrição",
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
                            controller: _inputCategoria_Estoque,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Categoria",
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
                              LengthLimitingTextInputFormatter(5)
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório";
                              } else if (int.tryParse(value) == null) {
                                return "Formato Inválido";
                              } else {
                                return null;
                              }
                            },
                            controller: _inputQuantidadeInicial_Estoque,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Quantidade Inicial",
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
                              LengthLimitingTextInputFormatter(5)
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório";
                              } else if (int.tryParse(value) == null) {
                                return "Formato Inválido";
                              } else {
                                return null;
                              }
                            },
                            controller: _inputQuantidadeMinima_Estoque,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Quantidade Mínima",
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
                                if (_formKey_NovoItem_Estoque.currentState!
                                    .validate()) {}
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                "Salvar",
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
