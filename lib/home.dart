import 'package:flutter/material.dart';
import 'package:flutter_application_1/clientes.dart';
import 'package:flutter_application_1/estoque.dart';
import 'package:flutter_application_1/fornecedor.dart';
import 'package:flutter_application_1/novoPedido_Cliente.dart';
import 'package:flutter_application_1/pedidos.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            title: Text(
              "INÍCIO",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            iconTheme: IconThemeData(size: 40),
            centerTitle: true,
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
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
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding:
                          EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      elevation: 6,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Pedidos()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.difference_outlined,
                          color: Colors.black,
                          size: 60,
                        ),
                        Text(
                          "Pedidos",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding:
                          EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      elevation: 6, // Adiciona sombreamento
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Estoque()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.warehouse_outlined,
                          color: Colors.black,
                          size: 60,
                        ),
                        Text(
                          "Estoque",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding:
                          EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      elevation: 6, // Adiciona sombreamento
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Clientes()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 60,
                        ),
                        Text(
                          "Clientes",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding:
                          EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      elevation: 6, // Adiciona sombreamento
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Fornecedor()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.factory_outlined,
                          color: Colors.black,
                          size: 60,
                        ),
                        Text(
                          "Fornecedor",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Divider(
                thickness: 3,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, top: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    elevation: 6, // Adiciona sombreamento
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NovoPedido_Cliente()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.note_add,
                        color: Colors.black,
                        size: 60,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Criar novo pedido",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
