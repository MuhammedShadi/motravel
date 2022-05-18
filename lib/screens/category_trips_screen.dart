import 'package:flutter/material.dart';
import 'package:motravel/app_data.dart';
import 'package:motravel/widgets/trip_item.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRout = "/trips";

  @override
  Widget build(BuildContext context) {
    final routName =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routName["title"];
    final categoryId = routName["Id"];
    final filteredTrips = TripsData.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(categoryTitle!)),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
              id: filteredTrips[index].id,
              title: filteredTrips[index].title,
              imageUrl: filteredTrips[index].imageUrl,
              duration: filteredTrips[index].duration,
              tripType: filteredTrips[index].tripType,
              season: filteredTrips[index].season);
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}
