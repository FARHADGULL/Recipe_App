// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/api/mock_fooderlich_service.dart';
import 'package:starter/models/models.dart';

class SearchViewModel extends GetxController {
  final myrecipe = MockFooderlichService();

  var searchTextController = TextEditingController();
  var isSearchingStarted = false.obs;
  var suggestionList = <SimpleRecipe>[].obs;

  void startSearching() {
    isSearchingStarted.value = true;
  }

  void stopSearching() {
    isSearchingStarted.value = false;
  }

  search(String query) {
    if (query.isNotEmpty) {
      myrecipe.getRecipes(query).then((response) {
        suggestionList.clear();
        suggestionList.addAll(response);
      });
    } else {
      suggestionList.clear();
    }
  }
}
