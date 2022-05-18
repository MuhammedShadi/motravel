import 'package:flutter/material.dart';
import 'package:motravel/models/trip.dart';
import 'package:motravel/screens/trip_details_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  const TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
  });

  String get seasonText {
    if (season == Season.Winter) {
      return "الشتاء";
    }
    if (season == Season.Spring) {
      return "الربيع";
    }
    if (season == Season.Summer) {
      return "الصيف";
    }
    if (season == Season.Autumn) {
      return "الخريف";
    } else {
      return "غير معروف";
    }
  }

  String get tripTypeText {
    if (tripType == TripType.Activities) {
      return "أنشطة";
    }
    if (tripType == TripType.Exploration) {
      return "إستكشاف";
    }
    if (tripType == TripType.Recovery) {
      return "نقاهة";
    }
    if (tripType == TripType.Therapy) {
      return "معالجة";
    } else {
      return "غير معروف";
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context).pushNamed(TripDetailsScreen.screenRout,arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  alignment: Alignment.bottomRight,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.5, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.today, color: Colors.amber),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$duration أيام "),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.wb_sunny, color: Colors.amber),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(" فصل $seasonText"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.family_restroom, color: Colors.amber),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$tripTypeText "),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
