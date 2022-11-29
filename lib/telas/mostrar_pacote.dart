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
    );
  }
}
