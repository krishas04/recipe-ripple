import 'package:flutter/material.dart';
import 'package:recipe_ripple/models/base_diet_model.dart';

class DishModel implements BaseDietModel {
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
  // new field
  String category;

  DishModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.isSelected,
    required this.boxColor,
    required this.ingredients,
    required this.instructions,
    required this.category,
  });

  static List<DishModel> getDishes() {
    List<DishModel> dishes = [];
    dishes.add(
      DishModel(
        name: 'Exotic Fruit Salad',
        iconPath: 'assets/items/exotic_fruit_salad.svg',
        category: 'Salad',
        level: 'Easy',
        duration: '10 mins',
        calories: '150kCal',
        isSelected: true,
        boxColor: Color(0x80FF9D00),
        ingredients: [
          '1 starfruit, sliced',
          '1/2 cup mixed berries',
          '1 green apple, chopped',
          '1/2 cup watermelon cubes',
          '2 tablespoons honey',
          '2 tablespoons yogurt',
        ],
        instructions:
            '1. Chop all fruits into bite-sized pieces.\n'
            '2. Mix honey and yogurt to make a dressing.\n'
            '3. Toss fruits with the dressing.\n'
            '4. Serve chilled.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Rainbow Fruit Yogurt Salad',
        iconPath: 'assets/items/rainbow_fruit_yogurt_salad.svg',
        category: 'Salad',
        level: 'Easy',
        duration: '12 mins',
        calories: '140kCal',
        isSelected: false,
        boxColor: Color(0x80FFD93D),
        ingredients: [
          '1/2 cup strawberries',
          '1/2 cup blueberries',
          '1/2 cup kiwi slices',
          '1/2 cup orange segments',
          '1/2 cup grapes',
          '2 tablespoons yogurt',
        ],
        instructions:
            '1. Wash and slice all fruits.\n'
            '2. Mix fruits in a bowl.\n'
            '3. Add yogurt and gently toss.\n'
            '4. Chill for 10 minutes and serve.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Fruit and Berry Fusion Salad',
        iconPath: 'assets/items/fruitandberry_fusion_salad.svg',
        category: 'Salad',
        level: 'Easy',
        duration: '8 mins',
        calories: '130kCal',
        isSelected: false,
        boxColor: Color(0x80FF9D00),
        ingredients: [
          '1/2 cup blueberries',
          '1/2 cup raspberries',
          '1/2 cup diced mango',
          '1/2 cup pineapple chunks',
          '1 teaspoon lime juice',
        ],
        instructions:
            '1. Combine all fruits in a bowl.\n'
            '2. Drizzle with lime juice.\n'
            '3. Toss gently and serve fresh.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Blueberry Cheesecake',
        iconPath: 'assets/items/blueberry_cheesecake.svg',
        category: 'Cake',
        level: 'Medium',
        duration: '1 hr 30 mins',
        calories: '450kCal',
        isSelected: false,
        boxColor: Color(0x80FF9D00),
        ingredients: [
          '200g digestive biscuits',
          '100g butter, melted',
          '500g cream cheese',
          '200g sugar',
          '2 eggs',
          '1 tsp vanilla extract',
          '1 cup blueberries',
        ],
        instructions:
            '1. Crush biscuits and mix with melted butter. Press into pan.\n'
            '2. Beat cream cheese, sugar, eggs, and vanilla until smooth.\n'
            '3. Pour mixture over base and bake at 160°C for 50 mins.\n'
            '4. Cool, top with blueberries, and chill before serving.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Chocolate Fudge Cake',
        iconPath: 'assets/items/chocolate_fudge_cake.svg',
        category: 'Cake',
        level: 'Medium',
        duration: '1 hr',
        calories: '500kCal',
        isSelected: false,
        boxColor: Color(0x80FFD93D),
        ingredients: [
          '1 1/2 cups flour',
          '1 cup sugar',
          '1/2 cup cocoa powder',
          '1 tsp baking soda',
          '1/2 tsp salt',
          '2 eggs',
          '1 cup milk',
          '1/2 cup vegetable oil',
          '1 tsp vanilla extract',
        ],
        instructions:
            '1. Preheat oven to 180°C.\n'
            '2. Mix dry ingredients.\n'
            '3. Add eggs, milk, oil, and vanilla. Mix well.\n'
            '4. Pour into greased pan and bake for 30-35 mins.\n'
            '5. Cool and frost as desired.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Tiramisu Cake',
        iconPath: 'assets/items/tiramisu_cake.svg',
        category: 'Cake',
        level: 'Hard',
        duration: '2 hrs',
        calories: '400kCal',
        isSelected: false,
        boxColor: Color(0x80FF9D00),
        ingredients: [
          '6 egg yolks',
          '3/4 cup sugar',
          '500g mascarpone cheese',
          '1 cup heavy cream',
          '1 tsp vanilla extract',
          '1 cup strong coffee',
          '24 ladyfingers',
          'Cocoa powder for dusting',
        ],
        instructions:
            '1. Beat egg yolks and sugar until creamy.\n'
            '2. Add mascarpone and vanilla, mix well.\n'
            '3. Whip cream and fold into mixture.\n'
            '4. Dip ladyfingers in coffee and layer with cream mixture.\n'
            '5. Repeat layers and dust top with cocoa powder.\n'
            '6. Chill for 2 hours before serving.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Apple Pie',
        iconPath: 'assets/items/apple_pie.svg',
        category: 'Pie',
        level: 'Medium',
        duration: '1 hr',
        calories: '300kCal',
        isSelected: false,
        boxColor: Color(0x80FF9D00),
        ingredients: [
          '1 pie crust',
          '5 apples, peeled and sliced',
          '3/4 cup sugar',
          '1 tsp cinnamon',
          '1/4 tsp nutmeg',
          '1 tbsp lemon juice',
        ],
        instructions:
            '1. Preheat oven to 180°C.\n'
            '2. Mix apples with sugar, cinnamon, nutmeg, and lemon juice.\n'
            '3. Pour into pie crust and cover with top crust.\n'
            '4. Bake for 45-50 mins until golden.\n'
            '5. Cool slightly before serving.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Cherry Pie',
        iconPath: 'assets/items/cherry_pie.svg',
        category: 'Pie',
        level: 'Medium',
        duration: '1 hr',
        calories: '320kCal',
        isSelected: false,
        boxColor: Color(0x80FFD93D),
        ingredients: [
          '1 pie crust',
          '2 cups pitted cherries',
          '3/4 cup sugar',
          '2 tbsp cornstarch',
          '1 tsp lemon juice',
        ],
        instructions:
            '1. Preheat oven to 180°C.\n'
            '2. Mix cherries, sugar, cornstarch, and lemon juice.\n'
            '3. Pour into pie crust and cover with top crust.\n'
            '4. Bake for 45-50 mins until crust is golden.\n'
            '5. Let cool before serving.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Avocado Smoothie',
        iconPath: 'assets/items/avocado_and_mint_smoothie.svg',
        category: 'Smoothie',
        level: 'Easy',
        duration: '7 mins',
        calories: '220kCal',
        isSelected: false,
        boxColor: Color(0x80FF9D00),
        ingredients: [
          '1/2 ripe avocado',
          '6–8 fresh mint leaves',
          '1 banana',
          '1/2 cup Greek yogurt',
          '1/2 cup milk (or almond milk)',
          '1 teaspoon honey (optional)',
          'A few ice cubes',
        ],
        instructions:
            '1. Add avocado, mint leaves, banana, yogurt, and milk into a blender.\n'
            '2. Blend until smooth and creamy.\n'
            '3. Taste and add honey if you prefer it sweeter.\n'
            '4. Pour into a glass and serve chilled.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Pineapple Smoothie',
        iconPath: 'assets/items/pineapple_smoothie.svg',
        category: 'Smoothie',
        level: 'Easy',
        duration: '5 mins',
        calories: '180kCal',
        isSelected: false,
        boxColor: Color(0x80FFD93D),
        ingredients: [
          '1 cup pineapple chunks',
          '1/2 banana',
          '1/2 cup Greek yogurt',
          '1/2 cup milk (or coconut milk)',
          '1 teaspoon honey (optional)',
          'A few ice cubes',
        ],
        instructions:
            '1. Combine pineapple, banana, yogurt, milk, and ice in a blender.\n'
            '2. Blend until smooth.\n'
            '3. Add honey if needed for sweetness.\n'
            '4. Serve immediately while cold.',
      ),
    );

    dishes.add(
      DishModel(
        name: 'Peach Smoothie',
        iconPath: 'assets/items/peach_smoothie.svg',
        category: 'Smoothie',
        level: 'Easy',
        duration: '6 mins',
        calories: '170kCal',
        isSelected: false,
        boxColor: Color(0x80FF9D00),
        ingredients: [
          '1 cup peaches (fresh or frozen)',
          '1/2 banana',
          '1/2 cup Greek yogurt',
          '1/2 cup milk (or almond milk)',
          '1 teaspoon honey (optional)',
          'A few ice cubes',
        ],
        instructions:
            '1. Add peaches, banana, yogurt, and milk to a blender.\n'
            '2. Blend until creamy and smooth.\n'
            '3. Taste and sweeten with honey if desired.\n'
            '4. Serve chilled.\n'
            'Tip: Add a few strawberries for a pink hue!',
      ),
    );

    return dishes;
  }
}
