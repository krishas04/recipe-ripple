import 'package:flutter/material.dart';
import 'package:recipe_ripple/models/category_model.dart';
import 'package:recipe_ripple/models/dish_model.dart';
import 'package:recipe_ripple/pages/diet_layout.dart';
import 'package:recipe_ripple/pages/recipe.dart';

class CategoriesList extends StatefulWidget {
  final List<DishModel> dishes;
  final CategoryModel categories;
  const CategoriesList({
    super.key,
    required this.dishes,
    required this.categories,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: widget.dishes.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  for (var ds in widget.dishes) {
                    ds.isSelected = false;
                  }
                  widget.dishes[index].isSelected = true;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipePage(diet: widget.dishes[index]),
                    ),
                  );
                });
              },
              //layout for each diet
              child: DietLayout(diet: widget.dishes[index]),
            );
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'List of ${widget.categories.name}s',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
