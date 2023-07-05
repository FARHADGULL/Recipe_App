import 'package:flutter/material.dart';
import 'package:starter/models/simple_recipe.dart';

class RecipeDetils extends StatelessWidget {
  final SimpleRecipe recipe;
  const RecipeDetils({Key? key, required this.recipe,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final myrecipe = arguments['recipe'] as String;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
               
              ],
            ),
            bottom: PreferredSize(
              preferredSize:  const Size.fromHeight(40),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  )
                ),
                child: Center(child: Text(recipe.title, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                recipe.dishImage,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              //recipe information is a list of strings
              recipe.information.join('\n\n'),
              style: Theme.of(context).textTheme.headline6,
            ),
            )
        ],
      ),
    );
  }
}
