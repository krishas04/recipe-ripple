import 'package:recipe_ripple/models/base_diet_model.dart';
import 'package:recipe_ripple/models/category_model.dart';
import 'package:recipe_ripple/models/diet_model.dart';
import 'package:recipe_ripple/models/dish_model.dart';
import 'package:recipe_ripple/models/popular_model.dart';
import 'package:recipe_ripple/pages/categories_list.dart';
import 'package:recipe_ripple/pages/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_ripple/pages/search_result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<DietModel> filteredDiets = [];
  List<PopularDietsModel> popularDiets = [];
  List<PopularDietsModel> filteredPopularDiets = [];
  List<DishModel> dishes = [];
  List<BaseDietModel> searchedDiets = [];

  final TextEditingController _searchController = TextEditingController();

  List<String> selectedLevels = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
    filteredDiets = List.from(diets);
  }

  void _getPopularDiets() {
    popularDiets = PopularDietsModel.getPopularDiets();
    filteredPopularDiets = List.from(popularDiets);
  }

  void _getDishes() {
    dishes = DishModel.getDishes();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getDiets();
    _getPopularDiets();
    _searchController.addListener(_applyfilter);
    _getDishes();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          searchField(),
          SizedBox(height: 20),
          _categoriesSection(),
          SizedBox(height: 30),
          _dietSection(),
          SizedBox(height: 30),
          _popularDietSection(),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedSuperellipseBorder(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(100),
          topEnd: Radius.circular(100),
        ),
      ),
      backgroundColor: Color(0xbfFF9D00),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              width: 400,
              height: 250,
              padding: EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Filter By Levels',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff333333),
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: ['Easy', 'Medium', 'Hard']
                        .map(
                          (level) => FilterChip(
                            label: Text(level),
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xff333333),
                            ),
                            selected: selectedLevels.contains(level),
                            onSelected: (bool selected) {
                              setModalState(() {
                                if (selected) {
                                  selectedLevels.add(level);
                                } else {
                                  selectedLevels.remove(level);
                                }
                              });
                            },
                            backgroundColor: Color(0xffFBF3D5),
                            selectedColor: Color(0xbfFFD93D),
                            checkmarkColor: Color(0xffFBF3D5),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _navigateToSearchResults();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFDEB9E),
                    ),
                    child: Text(
                      'Ok',
                      style: TextStyle(fontSize: 15, color: Color(0xff333333)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _applyfilter() {
    String query = _searchController.text.toLowerCase();

    // combine all diet models
    List<BaseDietModel> allDietModels = [...diets, ...popularDiets, ...dishes];

    searchedDiets = allDietModels.where((diet) {
      final matchesSearch = diet.name.toLowerCase().contains(query);
      final matchesLevel =
          selectedLevels.isEmpty || selectedLevels.contains(diet.level);
      return matchesSearch && matchesLevel;
    }).toList();
  }

  Column _popularDietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            'Popular Diets',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  for (var d in filteredPopularDiets) {
                    d.isSelected = false;
                  }
                  filteredPopularDiets[index].isSelected = true;
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RecipePage(diet: filteredPopularDiets[index]),
                  ),
                );
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: popularDiets[index].isSelected
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: filteredPopularDiets[index].isSelected
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipOval(
                      child: SvgPicture.asset(
                        filteredPopularDiets[index].iconPath,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          filteredPopularDiets[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xffA86523),
                          ),
                        ),
                        Text(
                          '${filteredPopularDiets[index].level} | ${filteredPopularDiets[index].duration} | ${filteredPopularDiets[index].calories} ',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/greater_than.svg',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: filteredPopularDiets.length,
          padding: EdgeInsets.only(left: 20, right: 20),
        ),
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            'Recommendation \n for diet',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          color: Colors.white,
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    for (var d in filteredDiets) {
                      d.isSelected = false;
                    }
                    filteredDiets[index].isSelected = true;
                  });
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: filteredDiets[index].boxColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(25),
                          child: SvgPicture.asset(
                            filteredDiets[index].iconPath,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      Text(
                        filteredDiets[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${filteredDiets[index].level} | ${filteredDiets[index].calories} | ${filteredDiets[index].duration}',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff7A7A73),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (filteredDiets[index].isSelected == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecipePage(diet: filteredDiets[index]),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                              colors: [
                                filteredDiets[index].isSelected
                                    ? Color(0xffBBDCE5)
                                    : Colors.transparent,
                                filteredDiets[index].isSelected
                                    ? Color(0xff468A9A)
                                    : Colors.transparent,
                              ],
                            ),
                          ),
                          child: Text(
                            'View',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: filteredDiets[index].isSelected
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemCount: filteredDiets.length,
          ),
        ),
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          height: 125,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    final filteredDishes = dishes
                        .where(
                          (dish) => dish.category == categories[index].name,
                        )
                        .toList();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CategoriesList(
                            dishes: filteredDishes,
                            categories: categories[index],
                          );
                        },
                      ),
                    );
                  });
                },
                child: Container(
                  width: 110,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: SvgPicture.asset(
                            categories[index].iconPath,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      Text(categories[index].name),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container searchField() {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 202, 198, 198),
            blurRadius: 9.0,
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onSubmitted: (value) {
          _navigateToSearchResults();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 10,
              height: 10,
            ),
          ),
          hintText: 'Search Pancake',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          suffixIcon: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                VerticalDivider(
                  color: const Color.fromARGB(255, 109, 91, 91),
                  thickness: 0.9,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(0.0, 8.0, 8.0, 8.0),
                  child: GestureDetector(
                    onTap: _showFilterSheet,
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  void _navigateToSearchResults() {
    String query = _searchController.text.toLowerCase();

    // combine all diet models
    List<BaseDietModel> allDietModels = [...diets, ...popularDiets, ...dishes];

    searchedDiets = allDietModels.where((diet) {
      final matchesSearch = diet.name.toLowerCase().contains(query);
      final matchesLevel =
          selectedLevels.isEmpty || selectedLevels.contains(diet.level);
      return matchesSearch && matchesLevel;
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultPage(
          searchedQuery: query,
          searchedDiets: searchedDiets,
        ),
      ),
    );
  }

  //appbar
  AppBar appBar() {
    return AppBar(
      title: Text(
        'Recipe Ripple',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true, //to bring title to the center
      backgroundColor: Colors.white,

      leading: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF7F8F8),
        ),
        child: SvgPicture.asset(
          'assets/icons/arrow.svg',
          width: 20,
          height: 20,
        ),
      ),

      actions: [
        Container(
          width: 35, //added
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffF7F8F8),
          ),
          child: SvgPicture.asset(
            'assets/icons/two_dots.svg',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
