import 'package:correios/repositories/pacote_repository.dart';
import 'package:correios/telas/mostrar_pacote.dart';
import 'package:flutter/material.dart';

import '../models/pacote.dart';

class Pacotes extends StatefulWidget {
  const Pacotes({Key? key}) : super(key: key);

  @override
  State<Pacotes> createState() => _PacotesState();
}

class _PacotesState extends State<Pacotes> {
  mostrarPacote(Pacote pacote){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MostrarPacote(pacote: pacote),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabela = PacoteRepository.tabela;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: ListView.separated(
        itemBuilder: (BuildContext context, int pacote){
          return ListTile(
            leading: Image.asset(tabela[pacote].icone),
            title: Text("Pacote: ${tabela[pacote].codigoRast}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
             ),
            ),
            trailing: Text("${tabela[pacote].peso.toString()}Kg",
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
            onLongPress: (){},
            onTap: () => mostrarPacote(tabela[pacote]),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),
    );
  }
}