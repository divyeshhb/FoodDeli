import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final catId = routeArgs['id'].toString();
    final catTitle = routeArgs['title'].toString();
    final catColor = routeArgs['color']; 
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
      drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text(catTitle),
          backgroundColor: catColor,
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                mealColor: catColor,
              );
            },
            itemCount: categoryMeals.length));
  }
}
