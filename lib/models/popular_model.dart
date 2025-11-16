import 'package:flutter/material.dart';
import 'package:recipe_ripple/models/base_diet_model.dart';

class PopularDietsModel implements BaseDietModel {
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
  Color boxColor;
  @override
  List<String> ingredients;
  @override
  String instructions;

  PopularDietsModel({
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

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(
      PopularDietsModel(
        name: 'Chow Fun',
        iconPath: 'assets/items/chowfun.svg',
        level: 'Medium',
        duration: '20mins',
        calories: '400kCal',
        isSelected: true,
        boxColor: Color(0x80C78A3B),
        ingredients: [
          '8 oz flat rice noodles',
          '1/2 lb beef or chicken, thinly sliced',
          '1 cup bean sprouts',
          '2 tbsp soy sauce',
          '1 tbsp oyster sauce',
          '1 tsp sesame oil',
          '2 green onions, chopped',
          '2 tbsp vegetable oil',
        ],
        instructions:
            '1. Soak rice noodles in warm water for 15 minutes, then drain.\n'
            '2. Heat vegetable oil in a wok over high heat.\n'
            '3. Stir-fry beef or chicken until cooked, then remove.\n'
            '4. Add noodles, soy sauce, oyster sauce, and sesame oil; stir-fry for 3 minutes.\n'
            '5. Add bean sprouts and green onions; stir-fry for 1 minute.\n'
            '6. Return meat to wok, toss, and serve hot.',
      ),
    );
    popularDiets.add(
      PopularDietsModel(
        name: 'Shish Kebab',
        iconPath: 'assets/items/shish_kabab.svg',
        level: 'Easy',
        duration: '60mins',
        calories: '550kCal',
        isSelected: false,
        boxColor: Color(0x80A16D28),
        ingredients: [
          '1 lb lamb or chicken, cubed',
          '1 bell pepper, cubed',
          '1 onion, cubed',
          '2 tbsp olive oil',
          '1 tsp paprika',
          '1 tsp cumin',
          'Salt and pepper to taste',
        ],
        instructions:
            '1. Marinate meat with olive oil, paprika, cumin, salt, and pepper for 30 minutes.\n'
            '2. Thread meat, bell pepper, and onion onto skewers.\n'
            '3. Preheat grill to medium-high heat.\n'
            '4. Grill skewers for 10-12 minutes, turning occasionally.\n'
            '5. Serve with pita bread or rice.',
      ),
    );
    popularDiets.add(
      PopularDietsModel(
        name: 'Ramen',
        iconPath: 'assets/items/ramen.svg',
        level: 'Medium',
        duration: '30mins',
        calories: '700kCal',
        isSelected: false,
        boxColor: Color(0x80C78A3B),
        ingredients: [
          '2 packs ramen noodles',
          '4 cups chicken broth',
          '1 tbsp soy sauce',
          '1 tsp miso paste',
          '1 boiled egg, halved',
          '1/4 cup sliced mushrooms',
          '2 green onions, chopped',
        ],
        instructions:
            '1. Boil ramen noodles according to package, then drain.\n'
            '2. In a pot, heat chicken broth with soy sauce and miso paste.\n'
            '3. Add mushrooms and simmer for 5 minutes.\n'
            '4. Place noodles in bowls, pour broth over them.\n'
            '5. Top with boiled egg and green onions. Serve hot.',
      ),
    );
    popularDiets.add(
      PopularDietsModel(
        name: 'Turkish Pide',
        iconPath: 'assets/items/turkish_pide.svg',
        level: 'Medium',
        duration: '2hours',
        calories: '600kCal',
        isSelected: false,
        boxColor: Color(0x80A16D28),
        ingredients: [
          '2 cups flour',
          '1 tsp yeast',
          '1 tsp sugar',
          '1/2 cup warm water',
          '1/2 lb ground beef',
          '1 onion, chopped',
          '1 tsp tomato paste',
          'Salt and pepper to taste',
        ],
        instructions:
            '1. Mix flour, yeast, sugar, and water to form dough; let rise for 1 hour.\n'
            '2. Cook ground beef with onion, tomato paste, salt, and pepper.\n'
            '3. Roll dough into ovals, spread beef mixture on top.\n'
            '4. Bake at 400°F for 15-20 minutes.\n'
            '5. Serve warm with yogurt.',
      ),
    );

    popularDiets.add(
      PopularDietsModel(
        name: 'Poke Bowl',
        iconPath: 'assets/items/poke_bowl.svg',
        level: 'Medium',
        duration: '25mins',
        calories: '500kCal',
        isSelected: false,
        boxColor: Color(0x80C78A3B),
        ingredients: [
          '1 cup sushi rice',
          '1/2 lb raw tuna, cubed',
          '1 avocado, diced',
          '1/4 cup seaweed',
          '2 tbsp soy sauce',
          '1 tsp sesame oil',
          '1 tbsp sesame seeds',
        ],
        instructions:
            '1. Cook sushi rice according to package instructions.\n'
            '2. Mix tuna with soy sauce and sesame oil.\n'
            '3. Place rice in bowls, top with tuna, avocado, and seaweed.\n'
            '4. Sprinkle sesame seeds on top.\n'
            '5. Serve fresh.',
      ),
    );

    popularDiets.add(
      PopularDietsModel(
        name: 'Jeopneun Gimbap',
        iconPath: 'assets/items/jeopneun_gimbap.svg',
        level: 'Easy',
        duration: '15mins',
        calories: '200kCal',
        isSelected: false,
        boxColor: Color(0x80A16D28),
        ingredients: [
          '2 cups cooked rice',
          '4 nori sheets',
          '1 carrot, julienned',
          '1 cucumber, julienned',
          '1/2 cup spinach, blanched',
          '2 eggs, scrambled',
          '1 tbsp sesame oil',
        ],
        instructions:
            '1. Lay nori sheet on a bamboo mat.\n'
            '2. Spread rice evenly, add carrot, cucumber, spinach, and egg.\n'
            '3. Roll tightly using the mat.\n'
            '4. Brush with sesame oil, slice, and serve.',
      ),
    );
    return popularDiets;
  }
}
