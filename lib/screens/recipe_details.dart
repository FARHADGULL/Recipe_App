import 'package:flutter/material.dart';

class RecipeDetils extends StatelessWidget {
  final Map<String, dynamic> arguments;

  const RecipeDetils({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final SimpleRecipe recipe = arguments['recipe'];

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
              preferredSize:  Size.fromHeight(40),
              child: Container(
                color: Colors.white,
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                
                child:  Center(child: Text('Recipe Title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/mag1.png',
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl. Donec euismod, nisl eget aliquet ultricies, nunc nisl aliquam nunc, quis aliquet nisl nisl quis nisl.',
              style: Theme.of(context).textTheme.headline5,
            ),
            )
        ],
      ),
    );
  }
}
