import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:motravel/screens/category_trips_screen.dart';
import 'package:motravel/screens/favoriteScreen.dart';
import 'package:motravel/screens/filter_screen.dart';
import 'package:motravel/screens/tabs_screen.dart';
import 'package:motravel/screens/trip_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Locale('en', ''), // enEnglish, no country code
        Locale('ar', 'AE'), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      title: 'MoTravel',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.amber),
          fontFamily: "ALJAZEERA",
          textTheme: ThemeData.light().textTheme.copyWith(
                headline2: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: "ALJAZEERA",
                  fontWeight: FontWeight.bold,
                ),
                headline3: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontFamily: "ALJAZEERA",
                  fontWeight: FontWeight.bold,
                ),
                headline4: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "ElMessiri",
                  fontWeight: FontWeight.bold,
                ),
                headline1: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "ElMessiri",
                  fontWeight: FontWeight.bold,
                ),
                headline5: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: "AMIRI",
                  fontWeight: FontWeight.bold,
                ),
                headline6: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: "AMIRI",
                  fontWeight: FontWeight.bold,
                ),
              )),
      //home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        "/": (ctx) => const TabsScreen(),
        CategoryTripsScreen.screenRout: (ctx) => CategoryTripsScreen(),
        TripDetailsScreen.screenRout: (ctx) => TripDetailsScreen(),
        FavoriteScreen.screenRout: (ctx) => FavoriteScreen(),
        FilterScreen.screenRout: (ctx) => FilterScreen(),
      },
    );
  }
}
