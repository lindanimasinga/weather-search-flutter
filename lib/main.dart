import 'package:flutter/material.dart';
import 'package:flutter_mvc_weather_app/src/view/city-details-view.dart';
import 'package:flutter_mvc_weather_app/src/view/search-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App Search',
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.orange,
            accentColor: Colors.orange,
            buttonColor: Colors.orange,
            floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
              backgroundColor: Colors.orange
            )
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SearchView(title: 'Weather Search'),
          CityDetailsView.route_name: (context) => CityDetailsView(),
        });
  }
}
