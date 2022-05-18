import 'package:flutter/material.dart';
import 'package:motravel/app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRout = '/tripDetails';

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = TripsData.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(selectedTrip.title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "الأنشطة"),
            buildViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedTrip.activities[index],
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, "البرنامج اليومي"),
            buildViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(" ${index + 1}"),
                      ),
                      title: Text(selectedTrip.program[index],style: Theme.of(context).textTheme.headline2,),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String sectionTitle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        sectionTitle,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget buildViewContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }
}
