import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'localizador.dart';

class Mapa extends StatefulWidget {
  const Mapa ({Key? key}) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng ponto0 = LatLng(-23.55656054031504, -46.66370475081876);
  LatLng destino =  LatLng(-23.50215303231884, -46.66243565379635);

  List<LatLng> coordenadasPolyline = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult resultado = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyB5b2mgPy5ZDihq3icRRok4GntSUuRQUHI",
        PointLatLng(ponto0.latitude, ponto0.longitude),
        PointLatLng(destino.latitude, destino.longitude));

    if(resultado.points.isNotEmpty) {
      //
      resultado.points.forEach(
              (PointLatLng points) => coordenadasPolyline.add(
              LatLng(points.latitude, points.longitude))
      );
      setState(() {});
    }
    print(resultado);
  }
  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: ponto0,
                zoom: 13.0,
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
              polylines: {

              if(coordenadasPolyline != null)
                Polyline(
                  polylineId: const PolylineId("rota"),
                  color: Colors.redAccent,
                  points: coordenadasPolyline,
                  width: 5,

      ),
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
                          ponto0 = LatLng(-23.65357311469295, -46.70733678859876);
                          destino = LatLng(-23.64735657518355, -46.760716134800134);

                          coordenadasPolyline.clear();
                          getPolyPoints();
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




