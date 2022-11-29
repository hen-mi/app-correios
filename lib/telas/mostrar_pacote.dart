import 'package:flutter/material.dart';
import 'package:correios/models/pacote.dart';

class MostrarPacote extends StatefulWidget {
  Pacote pacote;
  MostrarPacote({Key? key, required this.pacote}) : super(key: key);

  @override
  State<MostrarPacote> createState() => _MostrarPacoteState();
}

class _MostrarPacoteState extends State<MostrarPacote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pacote.codigoRast),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          right:5,
          left: 5,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(widget.pacote.icone),

            ),
            ListTile(
              leading: SizedBox(
                child: Image.asset('images/avatar.png'),
                width: 30,
              ),
              title: Text(
                "Proprietário: ${widget.pacote.proprietario}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              leading: SizedBox(
                child: Image.asset('images/origem.png'),
                width: 30,
              ),
              title: Text(
                "Origem: ${widget.pacote.destino}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              leading: SizedBox(
                  child: Image.asset('images/destino.png'),
                  width: 30,
              ),
              title: Text(
                "Destino: ${widget.pacote.destino}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              leading: SizedBox(
                child: Image.asset('images/caminhao.png'),
                width: 30,
              ),
              title: Text(
                "Código de rastreio: ${widget.pacote.codigoRast}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              leading: SizedBox(
                child: Image.asset('images/peso2.png'),
                width: 30,
              ),
              title: Text(
                "Peso: ${widget.pacote.peso}Kg",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
