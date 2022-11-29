import 'package:flutter/material.dart';
import 'package:correios/google-maps/mapa.dart';
import 'perfil.dart';
import 'pacotes.dart';
import 'novospacotes.dart';
import 'adicionar.dart';

class TelaNavegacao extends StatefulWidget {
  const TelaNavegacao({Key? key}) : super(key: key);

  @override
  State<TelaNavegacao> createState() => _TelaNavegacaoState();
}

class _TelaNavegacaoState extends State<TelaNavegacao> {

  int TelaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

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

        body: IndexedStack(
          index: TelaAtual,
          children: const <Widget>[
            Home(),
            Pacotes(),
            Mapa(),
            AdicionarNovoPacote(),
            Perfil()
          ],
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
    return Scaffold(
        backgroundColor: Colors.red[400],
        body: Center(
          child: Text("Tela Home"),
        ),
    );
  }
}
