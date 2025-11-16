import 'package:recipe_ripple/models/base_diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecipePage extends StatefulWidget {
  final BaseDietModel diet;

  const RecipePage({super.key, required this.diet});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  Set<String> selected = {'ingredients'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: [
          _image(),
          _rowOfIcons(),
          _divider(),
          _segmentedButton(),
          selected.first == 'ingredients'
              ? _ingredientsContent()
              : _instructionContent(),
        ],
      ),
    );
  }

  Widget _ingredientsContent() {
    return Container(
      width: 200,
      height: 300,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.diet.boxColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.diet.ingredients.isNotEmpty)
            for (var i in widget.diet.ingredients)
              RichText(text: _buildIngredientText(i))
          else
            const Text('No ingredients available.'),
        ],
      ),
    );
  }

  TextSpan _buildIngredientText(String ingredient) {
    final RegExp measurementRegExp = RegExp(
      r'^\s*[\d½¼¾\/\.\s]+(?:cup|cups|tablespoon|tablespoons|teaspoon|teaspoons|oz|ounce|ounces|g|grams|ml|large)?\b',
      caseSensitive: false,
    );

    final match = measurementRegExp.firstMatch(ingredient);

    if (match != null) {
      String measurement = match.group(0)!;
      String rest = ingredient.substring(measurement.length).trim();

      return TextSpan(
        style: TextStyle(fontSize: 15, color: Color(0xff333333)),
        children: [
          TextSpan(
            text: '•',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xff7B4019),
            ),
          ),
          TextSpan(
            text: ' $measurement',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: rest.isNotEmpty ? ' $rest' : ''),
        ],
      );
    } else {
      return TextSpan(text: '');
    }
  }

  Widget _instructionContent() {
    List<String> steps = widget.diet.instructions.split('\n');
    return Container(
      width: 200,
      height: 300,
      padding: EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 8),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.diet.boxColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (steps.isNotEmpty)
            Column(
              children: steps
                  .asMap()
                  .entries
                  .map(
                    (entry) => Padding(
                      padding: EdgeInsetsGeometry.only(bottom: 8),
                      child: _buildInstructionText(entry.value),
                    ),
                  )
                  .toList(),
            )
          else
            const Text('No instructions available.'),
        ],
      ),
    );
  }

  Row _buildInstructionText(String instruction) {
    final RegExp measurementRegExp = RegExp(r'^\s*\d\.\s');

    final match = measurementRegExp.firstMatch(instruction);

    if (match != null) {
      String stepNum = match.group(0)!;
      String stepText = instruction.substring(stepNum.length).trim();

      return Row(
        children: [
          Text(
            stepNum,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff7B4019),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              stepText,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff333333),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(children: [Text('')]);
    }
  }

  Center _segmentedButton() {
    return Center(
      child: SegmentedButton(
        style: SegmentedButton.styleFrom(
          backgroundColor: Color(0xffCBCBCB),
          foregroundColor: Color(0xff708993),
          selectedForegroundColor: Color(0xff333333),
          selectedBackgroundColor: widget.diet.boxColor,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
          ),
        ),
        segments: [
          ButtonSegment(value: 'ingredients', label: Text('Ingredients')),
          ButtonSegment(value: 'instruction', label: Text('Instruction')),
        ],
        selected: selected,
        onSelectionChanged: (newSelection) {
          setState(() {
            selected = newSelection;
          });
        },
      ),
    );
  }

  Divider _divider() {
    return Divider(
      indent: 10,
      endIndent: 10,
      thickness: 0.5,
      color: Color(0xffCBCBCB),
    );
  }

  Row _rowOfIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _infoCard('Level', Icons.psychology, widget.diet.level),
        SizedBox(width: 10),
        _infoCard(
          'Calories',
          Icons.local_fire_department,
          widget.diet.calories,
        ),
        SizedBox(width: 10),
        _infoCard('Duration', Icons.access_time, widget.diet.duration),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'Recipe of ${widget.diet.name}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _infoCard(String label, IconData icon, String value) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: widget.diet.boxColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(color: Color(0xff333333))),
          Icon(icon, color: Color(0xff333333)),
          Text(value, style: TextStyle(color: Color(0xff333333))),
        ],
      ),
    );
  }

  Padding _image() {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60, bottom: 10),
      child: ClipOval(
        child: SvgPicture.asset(widget.diet.iconPath, width: 300, height: 300),
      ),
    );
  }
}
