import 'package:flutter/material.dart';
import 'package:motravel/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenRout = "/FilterScreen";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isInSummer = false;
  var isInWinter = false;
  var isForFamily = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("الفلتر")),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 30),
                buildSwitchList("الرحلات الصيفية",
                    "إظهار الرحلات في فصل الصيف فقط", isInSummer, (newValue) {
                  setState(() {
                    isInSummer = newValue!;
                  });
                }),
                buildSwitchList("الرحلات الشتوية",
                    "إظهار الرحلات في فصل الشتاء فقط", isInWinter, (newValue) {
                  setState(() {
                    isInWinter = newValue!;
                  });
                }),
                buildSwitchList(
                    "الرحلات العائلية", "إظهار العائلية فقط", isForFamily,
                    (newValue) {
                  setState(() {
                    isForFamily = newValue!;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSwitchList(String title, String subTitle, var currentValue,
      Function(bool?) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
