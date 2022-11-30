import 'package:correios/repositories/pacote_repository.dart';
import 'package:correios/telas/mostrar_pacote.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../models/pacote.dart';
import 'adicionar.dart';
import 'principal.dart';

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
    final tabelaEntregues = PacoteRepository.tabelaEntregues;
    return Scaffold(
      backgroundColor: Colors.white,

      body:

          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 16),
                child: Text('Para Entregar',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
              ),

          Expanded(
            flex: 100,
            child: ListView.separated(
            itemBuilder: (BuildContext context, int pacote){
              return Dismissible(
                child: ListTile(
                  leading: Image.asset(tabela[pacote].icone),
                  title: Text("Pacote: ${tabela[pacote].codigoRast}",
                    style: const TextStyle(
                      color: Colors.black,
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
                ),
                key: Key(tabela[pacote].codigoRast),
              );
            },
            padding: EdgeInsets.all(16),
            separatorBuilder: (_, ___) => Divider(),
            itemCount: tabela.length,
          ),

          ),
              Padding(padding: EdgeInsets.only(top: 16),
                child: Text('Entregues',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
              ),
              Expanded(
                flex: 100,

                child: ListView.separated(

                  itemBuilder: (BuildContext context, int pacote){
                    return Dismissible(

                      child: Card(
                        color: Colors.green[600]!.withOpacity(0.55),
                      child: ListTile(
                        leading: Image.asset(tabelaEntregues[pacote].icone),
                        title: Text("Pacote: ${tabelaEntregues[pacote].codigoRast}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text("${tabelaEntregues[pacote].peso.toString()}Kg",
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        onLongPress: (){},
                        onTap: () => mostrarPacote(tabelaEntregues[pacote]),
                      ),
                    ),
                      key: Key(tabelaEntregues[pacote].codigoRast),
                    );
                  },
                  padding: EdgeInsets.all(2),
                  separatorBuilder: (_, ___) => Divider(),
                  itemCount: tabelaEntregues.length,
                ),

              ),
      ],


    ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdicionarNovoPacote(),
                ),
              );
            },
            child: Icon(Icons.add, color: Colors.white,),
            backgroundColor: Colors.amber,
          ),

    );
  }
}