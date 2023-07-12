import 'package:flutter/material.dart';
import 'package:starter/models/simple_recipe.dart';

class RecipeDetils extends StatelessWidget {
  final SimpleRecipe recipe;
  const RecipeDetils({Key? key, required this.recipe,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(recipe.title),
              centerTitle: true,
              background: Image.asset(
                recipe.dishImage,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                //recipe information is a list of strings
                recipe.information.join('\n\n'),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            )
        ],
      ),
    );
  }
}
