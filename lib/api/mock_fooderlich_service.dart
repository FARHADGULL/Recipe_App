import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

// Mock recipe service that grabs sample json data to mock recipe request/response
class MockFooderlichService {
  // Batch request that gets both today recipes and friend's feed
  Future<ExploreData> getExploreData() async {
    //print('I am exploredata function');
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendFeed();

    return ExploreData(todayRecipes, friendPosts);
  }

  // Get sample explore recipes json to display in ui
  Future<List<ExploreRecipe>> _getTodayRecipes() async {
    // Simulate api request wait time

    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_explore_recipes.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);
    // Go through each recipe and convert json to ExploreRecipe object.
    if (json['recipes'] != null) {
      final recipes = <ExploreRecipe>[];
      json['recipes'].forEach((v) {
        recipes.add(ExploreRecipe.fromJson(v));
      });
      return recipes;
    } else {
      return [];
    }
  }

  // Get the sample friend json posts to display in ui
  Future<List<Post>> _getFriendFeed() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_friends_feed.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each post and convert json to Post object.
    if (json['feed'] != null) {
      final posts = <Post>[];
      json['feed'].forEach((v) {
        posts.add(Post.fromJson(v));
      });
      return posts;
    } else {
      return [];
    }
  }

  // Get the sample recipe json to display in ui
  Future<List<SimpleRecipe>> getRecipes(String? query) async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_recipes.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe and convert json to SimpleRecipe object.
    if (json['recipes'] != null) {
      final recipes = <SimpleRecipe>[];
      json['recipes'].forEach((v) {
        if (query == null) {
          recipes.add(SimpleRecipe.fromJson(v));
          return;
        } else {
          var jsonConverted = SimpleRecipe.fromJson((v));
          if (jsonConverted.title.toLowerCase().contains(query.toLowerCase())) {
            recipes.add(jsonConverted);
          }
        }
      });
      print("Length : ${recipes.length}");
      return recipes;
    } else {
      return [];
    }
  }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
