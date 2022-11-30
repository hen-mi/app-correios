
import 'package:correios/telas/adicionar.dart';
import 'package:correios/telas/pacotes.dart';
import 'package:flutter/material.dart';
import 'google-maps/mapa.dart';
import 'telas/principal.dart';
import 'telas/perfil.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
     initialRoute: "/Home",
    theme: ThemeData(
      primarySwatch: Colors.amber,

      secondaryHeaderColor: Colors.white,
    ),
    routes: {
       "/Home": (context) => TelaNavegacao(),
      "/Pacotes": (context) => Pacotes(),
      "/Mapa": (context) => Mapa(),
      "/NovoPacote": (context) => AdicionarNovoPacote(),
      "/Perfil": (context) => Perfil(),

    },

  )

  );
}



