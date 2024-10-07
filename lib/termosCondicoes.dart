import 'package:flutter/material.dart';

class TermosCondicoes extends StatefulWidget {
  const TermosCondicoes({super.key});

  @override
  State<TermosCondicoes> createState() => _TermosCondicoesState();
}

class _TermosCondicoesState extends State<TermosCondicoes> {
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque felis diam, placerat lobortis augue non, dignissim efficitur erat. Nam porttitor mauris eget imperdiet rutrum. Quisque aliquam consequat finibus. Nam malesuada nisi id turpis aliquet blandit. Praesent elementum quis risus et bibendum. Suspendisse dictum leo id massa ullamcorper imperdiet. Aliquam id feugiat leo, placerat lobortis libero. Integer feugiat consequat consectetur. Cras posuere nec nulla ultrices aliquam. Aenean ut tortor sollicitudin, maximus purus sodales, consequat lacus. Donec maximus dignissim tortor quis consectetur. Praesent ac lectus ullamcorper, porta enim sed, rhoncus nunc. Nunc a nulla interdum, ornare libero a, placerat libero. Nunc id eros sit amet arcu maximus commodo. Phasellus vestibulum ante a commodo volutpat. Donec maximus dignissim tortor quis consectetur. Praesent ac lectus ullamcorper, porta enim sed, rhoncus nunc. Nunc a nulla interdum, ornare libero a, placerat libero. Nunc id eros sit amet arcu maximus commodo. Phasellus vestibulum ante a commodo volutpat.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 60, right: 60, top: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFFF00),
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text(
                            "Voltar",
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
            )));
  }
}
