import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function _setFilter;
  final Map<String, bool> filterInit;
  FiltersScreen(this.filterInit,this._setFilter);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filterInit['isGlutenFree'];
    _isVegan = widget.filterInit['isVegan'];
    _isVegetarian = widget.filterInit['isVegetarian'];
    _isLactoseFree = widget.filterInit['isLactoseFree'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> _filterData = {
                'isGlutenFree': _isGlutenFree,
                'isLactoseFree': _isLactoseFree,
                'isVegan': _isVegan,
                'isVegetarian': _isVegetarian,
              };
              widget._setFilter(_filterData);
            },
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adjust your preferences',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gluten-free'),
                  value: _isGlutenFree,
                  subtitle: Text('Only include gluten-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  value: _isVegan,
                  subtitle: Text('Only include vegan meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  value: _isVegetarian,
                  subtitle: Text('Only include vegetarian meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-free'),
                  value: _isLactoseFree,
                  subtitle: Text('Only includes lactose-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
