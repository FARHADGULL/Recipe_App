import 'package:flutter/material.dart';
import '../models/models.dart';

class SimpleRecipeListView extends StatelessWidget {
  final List<SimpleRecipe>? recipes;
  const SimpleRecipeListView({Key? key, this.recipes}) : super(key: key);
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
            child: recipes!.isEmpty
                ? const Text('No Recipes')
                : ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: recipes!.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes?[index];
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
    return Card(
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
    );
  }
}
