import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mvc_weather_app/src/model/city.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'city-details-view.dart';

class CityView extends StatefulWidget {
  final City _city;

  CityView(this._city);

  @override
  State<StatefulWidget> createState() {
    return CityState(_city);
  }
}

class CityState extends State<CityView> {
  City _city;

  CityState(this._city);

  @override
  Widget build(BuildContext context) {
    log(_city.name);
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.cloud,
                    color: Colors.orange,
                  ),
                  title: Text('${_city.name}\n'),
                  subtitle: Text(
                      '${_city.weather[0].description} \nTemparature: ${_city.main.temp} \u2103')),
              ButtonTheme.bar(
                  child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('View'),
                    onPressed: () {
                      viewCityDetails();
                    },
                  )
                ],
              )),
              /* ListTile(
                                       
                                        leading: GoogleMap(
                                          onMapCreated: _onMapCreated,
                                          initialCameraPosition: CameraPosition(
                                          target: _center,
                                          zoom: 11.0,
                                      ),
                                    ))*/
            ],
          ),
        ));
  }

  void viewCityDetails() {
    Navigator.pushNamed(context, CityDetailsView.route_name, arguments: _city);
  }
}
