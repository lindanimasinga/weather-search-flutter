import 'package:flutter/material.dart';
import 'package:flutter_mvc_weather_app/src/view/city-details-view.dart';
import 'package:flutter_mvc_weather_app/src/view/search-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather App Search',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SearchView(title: 'Weather Search'),
          '/citydetails': (context) => CityDetailsView(),
        });
  }
}
