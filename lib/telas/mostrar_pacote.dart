import 'package:flutter/material.dart';
import 'package:correios/models/pacote.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:correios/google-maps/rota.dart';
import 'package:geocoding/geocoding.dart';
import 'package:correios/google-maps/mapa.dart';

class Rota {
  LatLng origem;
  LatLng destino;
  Rota(this.origem, this.destino);
}

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
        title: Text(widget.pacote.codigoRast, style: TextStyle(
          color: Colors.white,
        )),
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
                child: Icon(Icons.person, color: Colors.amber),
                width: 30,
              ),
              title: Text(
                "Proprietário: ${widget.pacote.proprietario}",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: SizedBox(
                child: Icon(Icons.location_on_sharp, color: Colors.red),
                width: 30,
              ),
              title: Text(
                "Origem: ${widget.pacote.origem}",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ),
            ListTile(
              leading: SizedBox(
                  child: Icon(Icons.location_on_sharp, color: Colors.green),
                  width: 30,
              ),
              title: Text(
                "Destino: ${widget.pacote.destino}",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ),
            ListTile(
              leading: SizedBox(
                child: Image.asset('images/caminhao.png', color: Colors.amber),
                width: 30,
              ),
              title: Text(
                "Código de rastreio: ${widget.pacote.codigoRast}",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: SizedBox(
                child: Image.asset('images/peso2.png', color: Colors.amber),
                width: 30,
              ),
              title: Text(
                "Peso: ${widget.pacote.peso}Kg",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
              child: SizedBox(
                height: 50,

                child: ElevatedButton(
                    style: ButtonStyle(

                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),

                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.amber),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.black.withOpacity(0.04);
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed))
                            return Colors.black.withOpacity(0.20);
                          return null;
                        },
                      ),
                    ),
                    onPressed: () async {

                        print('Botão funciona');
                        List<Location> origem = await locationFromAddress(widget.pacote.origem);

                        List<Location> destino = await locationFromAddress(widget.pacote.destino);

                        Rota rota = Rota(LatLng(0,0), LatLng(0,0));
                        rota.origem = LatLng(origem.last.latitude, origem.last.longitude);
                        rota.destino = LatLng(destino.last.latitude, destino.last.longitude);

                        setState(() {

                          if(rota.origem != LatLng(0,0) && rota.destino != LatLng(0,0)) {

                            Navigator.pushNamed(context, "/Mapa", arguments: {'origem': rota.origem,'destino': rota.destino} );
                          }

                        });



                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map_outlined),
                        Padding(padding: EdgeInsets.all(16),
                          child: Text(
                            'Mostrar no mapa',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,

                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
