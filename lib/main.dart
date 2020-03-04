import 'package:flutter/material.dart';

import './dummy-data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegan': false,
    'isVegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS; 

  List<Meal> favMeals = []; 
  void setFilter(Map<String, bool> _filterData){
    _filters=_filterData;
    availableMeals=DUMMY_MEALS.where((meal) { 
      if(_filters['isGlutenFree'] && !meal.isGlutenFree){
        return false;
      }
      if(_filters['isLactoseFree'] && !meal.isLactoseFree){
        return false;
      } 
      if(_filters['isVegan'] && !meal.isVegan){
        return false;
      } 
      if(_filters['isVegetarian'] && !meal.isVegetarian){
        return false;
      } 
      return true;
    }).toList();
  }

  void toggleFav(String mealId){
    final existingIndex = favMeals.indexWhere((meal)=>meal.id==mealId);
    if(existingIndex>=0){
      setState(() {
        favMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favMeals.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
      });
    }
  }
  bool isFav(String id){
    return favMeals.any((meal)=>meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodDeli',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
          )
        ),
      ),
      routes: {
        '/':(ctx) => TabsScreen(favMeals),
        CategoryMealsScreen.routeName:(ctx) => CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(toggleFav,isFav),
        FiltersScreen.routeName: (ctx)=>FiltersScreen(_filters,setFilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FoodDeli'),
      ),
      body: Center(
        child: Text('Zomato'),
      ),
    );
  }
}
