import 'package:correios/repositories/pacote_repository.dart';
import 'package:flutter/material.dart';

class Pacotes extends StatefulWidget {
  const Pacotes({Key? key}) : super(key: key);

  @override
  State<Pacotes> createState() => _PacotesState();
}

class _PacotesState extends State<Pacotes> {
  @override
  Widget build(BuildContext context) {
    final tabela = PacoteRepository.tabela;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda){
            return ListTile(
              leading: Image.asset(tabela[moeda].icone),
              title: Text("Pacote: ${tabela[moeda].codigoRast}"),
              trailing: Text("${tabela[moeda].peso.toString()}Kg"),
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, ___) => Divider(),
          itemCount: tabela.length,
        ),
      ),
    );
  }
}
