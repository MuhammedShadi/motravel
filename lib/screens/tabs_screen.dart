import 'package:flutter/material.dart';
import 'package:motravel/screens/categories_screen.dart';
import 'package:motravel/widgets/app_drawer.dart';

import 'favoriteScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  final List<Map<String, Widget>> _screens = [
    {
      "screen": CategoriesScreen(),
      "title":const Text(
      "التصنيفات",
      style: TextStyle(color: Colors.white, fontFamily: "ALJAZEERA"),
    ),
    },
    {
      "screen": FavoriteScreen(),
      "title": const Text(
      "المفضلة",
      style: TextStyle(color: Colors.white, fontFamily: "ALJAZEERA"),
    ),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: _screens[_selectedScreenIndex]["title"],
        ),
      ),
      drawer: const AppDrawer(),
      body: _screens[_selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedScreenIndex,
        onTap: _selectedScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "التصنيفات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "المفضلة",
          ),
        ],
      ),
    );
  }
}

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Center(
//             child: Text(
//               "دليلك السياحي",
//               style: TextStyle(color: Colors.white, fontFamily: "ALJAZEERA"),
//             ),
//           ),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: "التصنيفات",
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: "المفضلة",
//               ),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoriteScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
