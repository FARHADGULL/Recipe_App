import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/screens/recipe_detail_screen.dart';
import '../viewModel/search_viewmodel.dart';

class ToBuyScreen extends GetView<SearchViewModel> {
  const ToBuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchViewModel());
    // final controller2 = MockFooderlichService();

    // Future.delayed(Duration.zero, () {
    //   controller2.getRecipes().then((response) {
    //     controller.suggestionList.assignAll(response);
    //   });
    // });

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              _body(),
              controller.isSearchingStarted.isTrue
                  ? Positioned(
                      top: 1,
                      child: _body(),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    final controller = Get.find<SearchViewModel>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              if (value.isNotEmpty && value.length >= 3) {
                controller.search(value);
              } else {
                controller.stopSearching();
              }
              // controller.search(value);
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: controller.suggestionList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.suggestionList[index].title),
                onTap: () {
                  final selectedRecipe = controller.suggestionList[index];
                  // Do something with the selected recipe, like navigate to a recipe detail screen
                  Get.to(() => RecipeDetailScreen(recipe: selectedRecipe));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// Widget _suggestionList(List<SimpleRecipe> suggestionList) {
//   final controller = Get.find<SearchViewModel>();
//   return controller.suggestionList.isEmpty
//       ? Container()
//       : Container(
//           height: 200,
//           width: double.infinity,
//           color: Colors.white,
//           child: ListView.builder(
//             itemCount: suggestionList.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(suggestionList[index].title),
//                 onTap: () {
//                   final selectedRecipe = suggestionList[index];
//                   // Do something with the selected recipe, like navigate to a recipe detail screen
//                   Get.to(() => RecipeDetailScreen(recipe: selectedRecipe));
//                 },
//               );
//             },
//           ),
//         );
// }
