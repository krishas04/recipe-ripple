import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_ripple/models/base_diet_model.dart';

class DietLayout extends StatelessWidget {
  final BaseDietModel diet;
  const DietLayout({super.key, required this.diet});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: diet.isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        boxShadow: diet.isSelected
            ? [
                BoxShadow(
                  color: Color(0xbfDEDED1),
                  offset: Offset(0, 10),
                  blurRadius: 25,
                  spreadRadius: 0,
                ),
              ]
            : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          ClipOval(
            child: SvgPicture.asset(diet.iconPath, width: 90, height: 90),
          ),
          SizedBox(width: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                diet.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xffA86523),
                ),
              ),
              Text(
                '${diet.level} | ${diet.duration} | ${diet.calories} ',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
