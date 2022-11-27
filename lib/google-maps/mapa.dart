import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Mapa extends StatefulWidget {
  const Mapa ({Key? key}) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;


  LatLng ponto0 = LatLng(-23.55656054031504, -46.66370475081876);
  LatLng destino =  LatLng(-23.50215303231884, -46.66243565379635);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: ponto0,
                zoom: 11.0,
              ),
              markers: {

                Marker(markerId: MarkerId("origem"),
                    infoWindow: const InfoWindow(title: "Origem"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                    position: ponto0),
                Marker(markerId: MarkerId("destino"),
                    infoWindow: const InfoWindow(title: "Destino"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
                    position: destino)
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 70.0),
              child: SizedBox(
                width: 150,
                height: 45,

                child: ElevatedButton(
                    style: ButtonStyle(

                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.orange)
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
                    onPressed: () {
                      setState(() {
                          print('Botão funciona');
                          destino = LatLng(-23.64735657518355, -46.760716134800134);

                      });
                    },
                    child: Text(
                      'testando',
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
    );
  }
}




