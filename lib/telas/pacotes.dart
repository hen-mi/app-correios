import 'package:flutter/material.dart';

class Pacotes extends StatefulWidget {
  const Pacotes({Key? key}) : super(key: key);

  @override
  State<Pacotes> createState() => _PacotesState();
}

class _PacotesState extends State<Pacotes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        body: Center(
          child: Text("Pacotes"),
        ),
      ),
    );
  }
}
