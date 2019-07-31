import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CityDetailsView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CityDetailsView> {
  GoogleMapController _mapController;
  final LatLng _center = const LatLng(-33.8854886, 18.5576149);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather App Search'),
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
