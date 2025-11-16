import 'package:flutter/material.dart';
import 'package:recipe_ripple/models/base_diet_model.dart';

class DietModel implements BaseDietModel {
  @override
  String name;
  @override
  String iconPath;
  @override
  String level;
  @override
  String duration;
  @override
  String calories;
  @override
  bool isSelected;
  @override
  List<String> ingredients;
  @override
  String instructions;
  @override
  Color boxColor;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.isSelected,
    required this.boxColor,
    required this.ingredients,
    required this.instructions,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        name: 'Waffles',
        iconPath: 'assets/items/waffles.svg',
        level: 'Easy',
        duration: '15mins',
        calories: '200kCal',
        isSelected: true,
        boxColor: Color(0x80FF9D00),
        ingredients: [
          '1½ cups all-purpose flour',
          '2 tablespoons sugar',
          '1 tablespoon baking powder',
          '½ teaspoon salt',
          '2 large eggs',
          '1¼ cups milk',
          '½ cup melted butter(or vegetable oil)',
          '1 teaspoon vanilla extract',
        ],
        instructions:
            '1. Preheat your waffle maker.\n'
            '2. In a large bowl, whisk together flour, sugar, baking powder, and salt.\n'
            '3. In another bowl, beat eggs, then mix in milk, melted butter, and vanilla.\n'
            '4. Combine wet and dry ingredients — stir until smooth.\n'
            '5. Pour batter into preheated waffle iron and cook until golden brown.\n'
            '6. Serve with honey, maple syrup, or fruits.',
      ),
    );
    diets.add(
      DietModel(
        name: 'Pita Pocket',
        iconPath: 'assets/items/pita_pocket.svg',
        level: 'Hard',
        duration: '60mins',
        calories: '180kCal',
        isSelected: false,
        boxColor: Color(0x80FFD93D),
        ingredients: [
          '2 pita breads',
          '1 cup cooked chicken or falafel',
          '¼ cup shredded lettuce',
          '¼ cup diced tomatoes',
          '2 tablespoons chopped onions',
          '2 tablespoons mayonnaise or hummus',
          'Salt and pepper to taste',
        ],
        instructions:
            '1. Warm pita bread slightly and cut in half to form pockets.\n'
            '2. Mix chicken (or falafel) with lettuce, tomatoes, onions, salt, and pepper.\n'
            '3. Spread mayonnaise or hummus inside each pocket.\n'
            '4. Fill the pockets with the mixture.\n'
            '5. Serve fresh with lemon wedges or yogurt sauce.',
      ),
    );
    diets.add(
      DietModel(
        name: 'Fried Chops',
        iconPath: 'assets/items/fried_chops.svg',
        level: 'Hard',
        duration: '30mins',
        calories: '350kCal',
        isSelected: false,
        boxColor: Color(0x80FF9D00),
        ingredients: [
          '4 lamb or pork chops',
          '1 teaspoon salt',
          '½ teaspoon pepper',
          '½ teaspoon garlic powder',
          '½ teaspoon chili flakes (optional)',
          '1 egg (beaten)',
          '1 cup bread crumbs',
          '½ cup all-purpose flour',
          'Oil for frying',
        ],
        instructions:
            '1. Season chops with salt, pepper, garlic powder, and chili flakes.\n'
            '2. Coat each chop with flour, dip in beaten egg, and roll in bread crumbs.\n'
            '3. Heat oil in a frying pan over medium heat.\n'
            '4. Fry chops for 3–4 minutes per side until golden brown and cooked through.\n'
            '5. Drain on paper towels and serve hot with ketchup or salad.',
      ),
    );
    diets.add(
      DietModel(
        name: 'Ice Cream',
        iconPath: 'assets/items/icecream.svg',
        level: 'Easy',
        duration: '5hours',
        calories: '200kCal',
        isSelected: false,
        boxColor: Color(0x80FFD93D),
        ingredients: [
          '2 cups heavy cream',
          '1 cup milk',
          '¾ cup sugar',
          '1 tablespoon vanilla extract',
        ],
        instructions:
            '1. Mix cream, milk, sugar, and vanilla in a bowl until sugar dissolves.\n'
            '2. Pour mixture into an ice cream maker and churn until thick.\n'
            '3. If no machine, freeze for 2–3 hours, stirring every 30 minutes.\n'
            '4. Freeze overnight for smooth texture.\n'
            '5. Scoop and serve chilled.',
      ),
    );

    return diets;
  }
}
