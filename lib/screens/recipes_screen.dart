import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/simple_recipe_list_view.dart';

class RecipesScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  RecipesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getRecipes(null),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final recipess = snapshot.data;
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
              SimpleRecipeListView(myrecipe: recipess)
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
