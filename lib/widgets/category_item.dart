import 'package:flutter/material.dart';
import 'package:motravel/screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String Id;
  final String title;
  final String imageUrl;

  CategoryItem(this.Id, this.title, this.imageUrl);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryTripsScreen.screenRout, arguments: {
      "Id": Id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
