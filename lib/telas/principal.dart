import 'package:flutter/material.dart';
import 'package:correios/google-maps/mapa.dart';
import 'perfil.dart';
import 'pacotes.dart';
import 'novospacotes.dart';


class TelaNavegacao extends StatefulWidget {
  const TelaNavegacao({Key? key}) : super(key: key);

  @override
  State<TelaNavegacao> createState() => _TelaNavegacaoState();
}

class _TelaNavegacaoState extends State<TelaNavegacao> {

  int TelaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: TelaAtual,
          selectedItemColor: Colors.orange[300],
          unselectedItemColor: Colors.black54,
          onTap: (opcao) {
            print("clicou em $opcao");

            setState(() {
              TelaAtual = opcao;

            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
            label: "Início",
      ),
            BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2_rounded),
                label: "Pacotes",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.map_rounded),
                label: "Mapa",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_rounded),
              label: "Novos pacotes",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Perfil",
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          centerTitle: true,
          title: IndexedStack(
            index: TelaAtual,
            children: const <Text>[
              Text("Correios",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Pacotes",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Mapa",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Perfil",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Novos Pacotes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

        ),
        body: IndexedStack(
          index: TelaAtual,
          children: const <Widget>[
            Home(),
            Pacotes(),
            Mapa(),
            NovosPacotes(),
            Perfil()
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[400],
        body: Center(
          child: Text("Tela Home"),
        ),
      ),
    );
  }
}
