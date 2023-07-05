import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/models/models.dart';

class RecipeDetailScreen extends StatelessWidget {
  final SimpleRecipe recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              Get.toNamed('/recipe_details', arguments: {'recipe': recipe});
            },

          
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(recipe.dishImage),
                const SizedBox(height: 4),
                Text(
                  recipe.title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 4),
                Text(
                  recipe.duration,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 4),
                // Add more details about the recipe
                // based on your SimpleRecipe model
              ],
            ),
          )),
        ),
      ),
    ),
    );
  }
}
