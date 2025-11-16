import 'package:flutter/material.dart';
import 'package:recipe_ripple/models/base_diet_model.dart';
import 'package:recipe_ripple/pages/diet_layout.dart';
import 'package:recipe_ripple/pages/recipe.dart';

class SearchResultPage extends StatefulWidget {
  final String searchedQuery;
  final List<BaseDietModel> searchedDiets;
  const SearchResultPage({
    super.key,
    required this.searchedQuery,
    required this.searchedDiets,
  });

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: widget.searchedDiets.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 8, left: 90, right: 50),
              child: Text(
                'No results found for "${widget.searchedQuery}"!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      for (var ds in widget.searchedDiets) {
                        ds.isSelected = false; //sets value
                      }
                      widget.searchedDiets[index].isSelected = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipePage(diet: widget.searchedDiets[index]),
                      ),
                    );
                  },
                  child: DietLayout(diet: widget.searchedDiets[index]),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: widget.searchedDiets.length,
            ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: widget.searchedQuery.isNotEmpty
          ? Text(
              'Search Results for ${widget.searchedQuery}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(
              'Search Results',
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
