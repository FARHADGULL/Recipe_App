import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/screens/recipe_details.dart';
import 'package:starter/screens/recipes_screen.dart';
import 'package:starter/screens/tobuy_screen.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Fooderlich',
      //home: const Home(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/tobuy', page: () => const ToBuyScreen()),
        GetPage(name: '/recipes', page: () => RecipesScreen()),
        GetPage(name: '/recipe_details', page: () => RecipeDetils(arguments: {},)),
      ],
    );
  }
}
