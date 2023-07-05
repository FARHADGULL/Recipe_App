import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/models.dart';
import '../screens/recipe_details.dart';

class SimpleRecipeListView extends StatelessWidget {
  final List<SimpleRecipe>? myrecipe;
  const SimpleRecipeListView({Key? key, this.myrecipe,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recipes', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          Container(
            height: 600,
            color: Colors.transparent,
            child: myrecipe!.isEmpty
                ? const Text('No Recipes')
                : ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: myrecipe!.length,
                    itemBuilder: (context, index) {
                      final recipe = myrecipe?[index];
                      return buildCard(recipe);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    }),
          )
        ],
      ),
    );
  }

  Widget buildCard(SimpleRecipe? recipe) {
    return GestureDetector(
      onTap: () {
        Get.to(() => RecipeDetils(recipe: recipe));
      },
  child: Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(recipe!.dishImage),
          const SizedBox(height: 14),
          Text(recipe.title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(height: 8),
          Text(recipe.duration,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
        ],
      ),
    ),
  ),
    );

  }
}
