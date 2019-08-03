import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc_weather_app/src/model/city.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CityDetailsView extends StatefulWidget {

  static const route_name = '/citydetails';

  @override
  _State createState() => _State();
}

class _State extends State<CityDetailsView> {

  City _city;
  GoogleMapController _mapController;
  final LatLng _center = const LatLng(-33.8854886, 18.5576149);

  @override
  Widget build(BuildContext context) {
    _city = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(_city.name),
        ),
        body: Container(
            height: 300,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            )));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
}
