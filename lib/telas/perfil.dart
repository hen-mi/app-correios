import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  final String url =
      'https://img.freepik.com/vetores-gratis/conceito-de-funcionario-do-mes_23-2148457577.jpg?w=826&t=st=1669581007~exp=1669581607~hmac=a7eaae4a073d3c13d820e18d6a1b885be30d99644de7621c17d5b803c29bc0ef';
  final Color yellow = const Color.fromARGB(255, 255, 250, 175);

  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: yellow,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(26),
                    bottomRight: Radius.circular(26))),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Column(
                          children: const <Widget>[
                            Text("Entregas Feitas"),
                            Text("25"),
                          ],
                        ),
                      ),
                      Image(
                        alignment: Alignment.center,
                        image: NetworkImage(url),
                        width: 120,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Column(
                          children: const <Widget>[
                            Text('Cargo'),
                            Text('Entregador'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Id: 4587952312456',
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 64),
                  child: Text(
                    "Jairo Rodriguez",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: const <Widget>[
                          Icon(Icons.account_box),
                          Text('Verificado')
                        ],
                      ),
                      Column(
                        children: const <Widget>[
                          Icon(Icons.access_alarms),
                          Text('Pontual')
                        ],
                      ),
                      /*Column(
                        children: const <Widget>[
                          Icon(Icons.add_call),
                          Text('Liga para Confirmar')
                        ],
                      ),*/
                      Column(
                        children: const <Widget>[
                          Icon(Icons.account_balance_sharp),
                          Text('Empresa Parceira')
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        Icon(Icons.table_chart),
                        Text(
                          "Liderança",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.show_chart),
                        Text(
                          "Evolução",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.card_giftcard),
                        Text(
                          "Presentiar",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        Icon(Icons.qr_code),
                        Text(
                          "QR Code",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.blur_circular),
                        Text(
                          "Entregas Diarias",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.vibration_sharp),
                        Text(
                          "Terminar",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
