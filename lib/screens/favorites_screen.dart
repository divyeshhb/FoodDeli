import 'package:flutter/material.dart';
import 'package:ubereats/models/meal.dart';
import 'package:ubereats/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';
  final List<Meal> favMeals;
  FavoritesScreen(this.favMeals);
  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text('No Favorites - You can add them from Meal detail screen.'),
      );
    }
    else{
     return ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favMeals[index].id,
                title: favMeals[index].title,
                imageUrl: favMeals[index].imageUrl,
                duration: favMeals[index].duration,
                affordability: favMeals[index].affordability,
                complexity: favMeals[index].complexity,
                mealColor: Colors.red,
              );
            },
            itemCount: favMeals.length);
    }
  }
}
