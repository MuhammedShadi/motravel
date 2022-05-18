import 'package:flutter/material.dart';
import 'package:motravel/screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.secondary,
            child:  Text("دليلك السياحي",style: Theme.of(context).textTheme.headline1,),
          ),
          const SizedBox(height: 5),
          buildListTile(
            context,
            "التصنيفات",
            Icons.card_travel,
            () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          const Divider(),
          buildListTile(
            context,
            "الفلترة",
            Icons.filter_list,
            () => Navigator.of(context).pushNamed(FilterScreen.screenRout),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String title, IconData iconData,
      Function() onTapLink) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      onTap: onTapLink,
    );
  }
}
