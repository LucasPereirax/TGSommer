import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/clientes.dart';
import 'package:flutter_application_1/estoque.dart';
import 'package:flutter_application_1/fornecedor.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/pedidos.dart';

class NovoPedido_Pagamento extends StatefulWidget {
  const NovoPedido_Pagamento({super.key});

  @override
  State<NovoPedido_Pagamento> createState() => _NovoPedido_PagamentoState();
}

class _NovoPedido_PagamentoState extends State<NovoPedido_Pagamento> {
  ValueNotifier<Color> pix = ValueNotifier(Colors.green);
  ValueNotifier<Color> cartao = ValueNotifier(Colors.purple);
  ValueNotifier<Color> dinheiro = ValueNotifier(Colors.blue);
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Fornecedor()));
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
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ValueListenableBuilder(
                      valueListenable: pix,
                      builder: (BuildContext context, value, Widget? child) {
                        return Switch(
                          value: (pix.value == Colors.green),
                          activeColor: Colors.green,
                          onChanged: (bool value) {
                            if (value) {
                              pix.value = Colors.green;
                            } else {
                              pix.value = Colors.black;
                            }
                          },
                        );
                      }),
                  ValueListenableBuilder(
                    valueListenable: pix,
                    builder: (BuildContext context, value, Widget? child) {
                      return Text(
                        "PIX",
                        style: TextStyle(color: pix.value, fontSize: 28),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ValueListenableBuilder(
                      valueListenable: cartao,
                      builder: (BuildContext context, value, Widget? child) {
                        return Switch(
                          value: (cartao.value == Colors.purple),
                          activeColor: Colors.purple,
                          onChanged: (bool value) {
                            if (value) {
                              cartao.value = Colors.purple;
                            } else {
                              cartao.value = Colors.black;
                            }
                          },
                        );
                      }),
                  ValueListenableBuilder(
                    valueListenable: cartao,
                    builder: (BuildContext context, value, Widget? child) {
                      return Text(
                        "Cartão",
                        style: TextStyle(color: cartao.value, fontSize: 28),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ValueListenableBuilder(
                      valueListenable: dinheiro,
                      builder: (BuildContext context, value, Widget? child) {
                        return Switch(
                          value: (dinheiro.value == Colors.blue),
                          activeColor: Colors.blue,
                          onChanged: (bool value) {
                            if (value) {
                              dinheiro.value = Colors.blue;
                            } else {
                              dinheiro.value = Colors.black;
                            }
                          },
                        );
                      }),
                  ValueListenableBuilder(
                    valueListenable: dinheiro,
                    builder: (BuildContext context, value, Widget? child) {
                      return Text(
                        "Dinheiro",
                        style: TextStyle(color: dinheiro.value, fontSize: 28),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
