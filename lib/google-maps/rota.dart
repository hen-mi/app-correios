import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Rota {
  LatLng origem;
  LatLng destino;
  Rota({required this.origem, required this.destino});
}


class RotaWidget extends InheritedWidget{

     Rota rota = Rota(origem: LatLng(0,0), destino: LatLng(0,0));


     RotaWidget({Key? key, required Widget child, required rota}) : super(key: key, child: child);

     static Rota? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<RotaWidget>()?.rota;

    @override
      bool updateShouldNotify(RotaWidget oldWidget) => oldWidget.rota != rota;
}