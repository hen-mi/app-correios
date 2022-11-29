import 'package:correios/google-maps/mapa.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:correios/google-maps/rota.dart';

class Rota {
  LatLng origem;
  LatLng destino;
  Rota(this.origem, this.destino);
}

class AdicionarNovoPacote extends StatefulWidget {

  const AdicionarNovoPacote({super.key});

  @override
  State<AdicionarNovoPacote> createState() => _AdicionarNovoPacoteState();
}

class _AdicionarNovoPacoteState extends State<AdicionarNovoPacote> {

  final TextEditingController DestinoControlador = TextEditingController();
  final TextEditingController OrigemControlador = TextEditingController();

  @override


  Widget build(BuildContext context) {

    void RetornaRota() {
      Navigator.pushReplacementNamed(context,
          "/Mapa",
          arguments: <String, String>{"origem" : OrigemControlador.text }
      );

    }
    return RotaWidget(

        rota: LatLng(0,0),

    child:GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*     Text(
                "Endereço de Origem",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ), */
              TextFormField(

                controller: OrigemControlador,
                textCapitalization: TextCapitalization.words,

                decoration: InputDecoration(hintText: "Rua Nome da rua, 777, Cidade",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                    borderSide:  BorderSide(color: Colors.deepOrange),

                  ),
                    labelText: "Origem",
                ),

              ),
              Container(
               margin: const EdgeInsets.only(top: 25.0),
              ),

              TextFormField(
                controller: DestinoControlador,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(hintText: "Rua Nome da rua, 777, Cidade",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),


                  ),
                    labelText: "Destino",

                ),

              ),
              Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: SizedBox(
                  width: 150,
                  height: 45,

                  child: ElevatedButton(
                      style: ButtonStyle(

                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),

                            )
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepOrange),
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
                        List<Location> origem = await locationFromAddress(OrigemControlador.text);

                        List<Location> destino = await locationFromAddress(DestinoControlador.text);

                        Rota rota = Rota(LatLng(0,0), LatLng(0,0));
                        rota.origem = LatLng(origem.last.latitude, origem.last.longitude);
                        rota.destino = LatLng(destino.last.latitude, destino.last.longitude);

                        setState(() {

                          if(rota.origem != LatLng(0,0) && rota.destino != LatLng(0,0)) {
                            Navigator.pushNamed(context, "/Mapa", arguments: {'origem': rota.origem,'destino': rota.destino} );
                          }

                        });

                      },

                      child: Text(
                        'Confirmar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,

                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        ),
    ),
    );
  }
}
