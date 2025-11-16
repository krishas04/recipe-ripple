import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad',
        iconPath: 'assets/items/salad.svg',
        boxColor: Color(0xbfFFD93D),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Cake',
        iconPath: 'assets/items/cake.svg',
        boxColor: Color(0xbfFF9D00),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Pie',
        iconPath: 'assets/items/pie.svg',
        boxColor: Color(0xbfFFD93D),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Smoothie',
        iconPath: 'assets/items/smoothies.svg',
        boxColor: Color(0xbfFF9D00),
      ),
    );

    return categories;
  }
}
