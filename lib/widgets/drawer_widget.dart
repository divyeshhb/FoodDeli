import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 0,
              ),
            ),
            height: 250,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  'https://www.pinclipart.com/picdir/big/78-780477_about-us-avatar-icon-red-png-clipart.png',
                  height: 150,
                ),
                Text(
                  'Divyesh Bansal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(Icons.restaurant, size: 25),
            title: Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            onTap:(){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.settings, size: 25),
            title: Text(
              'Filters',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            onTap:(){
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
