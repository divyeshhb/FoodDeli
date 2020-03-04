import 'package:flutter/material.dart';
import 'package:ubereats/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  final Function toggleFav;
  final Function isFav;
  MealDetailScreen(this.toggleFav,this.isFav);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<Object, Object>;
    final mealId = routeArgs['id'].toString();
    final mealColor = routeArgs['mealColor'];
    final sM = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(sM.title),
        backgroundColor: mealColor,
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                sM.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: mealColor, width: 3)),
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(5),
              height: 36.3 * sM.ingredients.length.toDouble(),
              width: 400,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: mealColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(
                      '${sM.ingredients[index]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                itemCount: sM.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps to follow',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: mealColor, width: 3)),
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(5),
              height: 36.3 * sM.ingredients.length.toDouble(),
              width: 400,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: mealColor,
                        foregroundColor: Colors.white,
                        child: Text('# ${index+1}'),
                      ),
                      title: Text('${sM.steps[index]}'),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: sM.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFav(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFav(mealId),
      ),
    );
  }
}
