import 'package:flutter/material.dart';
import 'package:correios/google-maps/mapa.dart';
import 'package:pie_chart/pie_chart.dart';
import 'perfil.dart';
import 'pacotes.dart';
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
                icon: Icon(Icons.map_rounded),
                label: "Mapa",
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
            Mapa(),
            Perfil(),
            AdicionarNovoPacote(),
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

  int totalpacotes = 5;
  int entregue = 0;
Map<String, double> dataMap = {
  'Entregue': 2,
};

  final colorList = <Color>[
    Colors.white,
  ];


  @override
  Widget build(BuildContext context) {
    entregue = dataMap['Entregue']!.toInt();
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Column(



         children:[
           Padding(padding: EdgeInsets.only(top: 30),
           child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 14),
                  child: Column(
                  children: [
                    Text(
          "Estas são suas entregas",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),

        ),

                    Text(
                      "Foram $entregue de $totalpacotes",
                      style: TextStyle(fontSize: 16, color: Colors.deepOrange), ),
          ],
        ),
              ),

                Padding(padding: EdgeInsets.all(16),
                  child: PieChart(
                    dataMap: dataMap,

                    chartType: ChartType.ring,
                    initialAngleInDegree: 270,


                    centerText: "$entregue/$totalpacotes",
                    centerTextStyle: TextStyle(
                      color: Colors.white,


                    ),
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    baseChartColor: Colors.grey[300]!.withOpacity(0.25),
                    colorList: colorList,
                    legendOptions: LegendOptions(
                      showLegends: false,
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: false,
                      showChartValues: false,
                    ),
                    totalValue: 6,
                  ),
                )


            ],
           ),
          ),

           Expanded(child: Pacotes()),

            ]
    ),
        ),
    );
  }
}
