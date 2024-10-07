import 'package:flutter/material.dart';
import 'package:flutter_application_1/clientes.dart';
import 'package:flutter_application_1/estoque.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/novoFornecedor.dart';
import 'package:flutter_application_1/pedidos.dart';

class Fornecedor extends StatefulWidget {
  const Fornecedor({super.key});

  @override
  State<Fornecedor> createState() => _FornecedorState();
}

class _FornecedorState extends State<Fornecedor> {
  final _formKey_Fornecedor = GlobalKey<FormState>();
  final _inputNomeFornecedor_Fornecedor = TextEditingController();

  @override
  void initState() {
    super.initState();
    _inputNomeFornecedor_Fornecedor.addListener(() {
      setState(() {});
    });
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
              title: Text(
                "FORNECEDOR",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                  Form(
                    key: _formKey_Fornecedor,
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
                            controller: _inputNomeFornecedor_Fornecedor,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              labelText: "Nome do fornecedor",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              suffixIcon: _inputNomeFornecedor_Fornecedor
                                      .text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        setState(() {
                                          _inputNomeFornecedor_Fornecedor
                                              .clear();
                                        });
                                      },
                                    )
                                  : Icon(Icons.search),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 530,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: FloatingActionButton(
                          backgroundColor: Colors.yellow,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NovoFornecedor(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.add,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
