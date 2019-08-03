import 'dart:developer';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc_weather_app/src/model/city.dart';
import 'package:flutter_mvc_weather_app/src/service/weather-service.dart';
import 'package:flutter_mvc_weather_app/src/view/city-details-view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'city-view.dart';

import 'package:flutter_google_places/flutter_google_places.dart';

class SearchView extends StatefulWidget {
  final String title;

  SearchView({Key key, this.title}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _googleApiKey = "AIzaSyB6j17UvvYy5I3MrI1_jviMFdWu191uIcs";
  final List<City> nearbyCities = [];
  GoogleMapController _mapController;
  final LatLng _center = const LatLng(-33.8854886, 18.5576149);
  final cityNames = [
    "Cape Town",
    "Durban",
    "Port Elizabeth",
    "Johannesburg",
    "Umtata",
    "Mpumalanga"
  ];

  @override
  void initState() {
    super.initState();
    cityNames.forEach((cityName) => WeatherService.fetchCurrentWeather(cityName)
        .listen((city) => setState(() {
              nearbyCities.add(city);
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App Search'),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: nearbyCities.length + 1,
            itemBuilder: (context, index) {
              return index == 0
                  ? _buildMapWidget()
                  : CityView(nearbyCities[index - 1]);
            },
          ),
          Container(
              margin: const EdgeInsets.all(16.0),
              child: Card(
                  child: PlacesAutocompleteFormField(
                apiKey: _googleApiKey,
                language: "en",
                mode: Mode.overlay,
              ))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera_alt,
        ),
        onPressed: openBarCodeScan,
      ),
    );
  }

  Widget _buildMapWidget() {
    return Container(
        height: 300,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void openBarCodeScan() {
    BarcodeScanner.scan().asStream()
    .listen((barcode) {
      WeatherService.fetchCurrentWeather(barcode).listen((city) {
            log(city.name);
            Navigator.pushNamed(context, CityDetailsView.route_name, arguments: city);
          }
        );
    });
  }
}
