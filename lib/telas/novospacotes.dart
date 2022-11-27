import 'package:flutter/material.dart';

class NovosPacotes extends StatefulWidget {
  const NovosPacotes({Key? key}) : super(key: key);

  @override
  State<NovosPacotes> createState() => _NovosPacotesState();
}

class _NovosPacotesState extends State<NovosPacotes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange[400],
        body: Center(
          child: Text("Novos Pacotes"),
        ),
      ),
    );
  }
}
