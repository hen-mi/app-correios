import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:correios/telas/adicionar.dart';
import 'package:correios/google-maps/rota.dart';

class Mapa extends StatefulWidget {

  const Mapa({super.key});

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {

  Completer<GoogleMapController> _controller = Completer();

  LatLng ponto0 = LatLng(-23.55656054031504, -46.66370475081876);
  LatLng destino =  LatLng(-23.50215303231884, -46.66243565379635);
  String nome = 'vazio';

  List<LatLng> coordenadasPolyline = [];
  List<LatLng> coordenadasPassadas = [];

     nomeLugar(LatLng coordenada) async {

     List<Placemark> nome = await placemarkFromCoordinates(coordenada.latitude, coordenada.longitude, localeIdentifier: "pt_BR");

     String? rua = nome.first.street;
     String? bairro = nome.first.subLocality;
     String? cidade = nome.first.administrativeArea;
     String endereco = '${rua}, ${bairro}, ${cidade}';

    return endereco;
   }
    void foo() async {
        nome = 'Destino: ' + await nomeLugar(destino);
    }

  void getPolyPoints(List<LatLng> coordenadasPolyline) async {
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

    foo();

    getPolyPoints(coordenadasPolyline);
    if(ponto0 != LatLng(-23.55656054031504, -46.66370475081876) && coordenadasPassadas != null){
      getPolyPoints(coordenadasPassadas);
    }
    Future.delayed(Duration.zero, () {



      final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

      if(arguments['origem'] != null &&  arguments['destino'] != null) {
        coordenadasPolyline.clear();
        setState(() {
          ponto0 = arguments['origem'];
          destino = arguments['destino'];
          foo();
          moveMapCamera(ponto0);
          coordenadasPolyline.clear();
          coordenadasPassadas.clear();
          getPolyPoints(coordenadasPassadas);
        });

      }

    } );
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    if(ponto0 != LatLng(-23.55656054031504, -46.66370475081876))
      coordenadasPolyline.clear();


    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Mapa para a rota atual',
        style: TextStyle(
          color: Colors.white,
        )),
      ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                target: destino,
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
              if(coordenadasPassadas != null)
                Polyline(
                  polylineId: const PolylineId("rota2"),
                  color: Colors.green,
                  points: coordenadasPassadas,
                  width: 5,
      ),
              },
            ),

            Container(
              margin: const EdgeInsets.only(top: 20,right: 40, left: 40),

              height: 40,
              child: SizedBox(

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
                        moveMapCamera(destino);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                          Expanded(
    child:Text('$nome', textAlign: TextAlign.center,),
    ),


                      ],
                    )
                ),
              ),
            ),

          ],
        ),
      );


  }
  Future<void> moveMapCamera(LatLng posicao) async {
    CameraPosition nepPos = CameraPosition(
      target: posicao,
      zoom: 12,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(nepPos));
  }

}




