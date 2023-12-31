import 'package:flutter/material.dart';
//import 'package:starter/components/card1.dart';
//import 'package:starter/components/card2.dart';
//import 'package:starter/components/card3.dart';
//import 'package:starter/models/explore_recipe.dart';
import 'package:starter/screens/explore_screen.dart';
import 'package:starter/screens/recipes_screen.dart';
import 'package:starter/screens/tobuy_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const ToBuyScreen()
  ];
// 9
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text('Fooderlich', style: Theme.of(context).textTheme.headline6)),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          // 5
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
// 6
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(Icons.explore),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Recipes'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To Buy'),
          ]),
    );
  }
}
