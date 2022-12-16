import 'package:flutter/material.dart';
import 'package:s_07_navigation/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filters;
  final Function saveFilters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten']!;
    _vegetarian = widget.filters['vegetarian']!;
    _vegan = widget.filters['vegan']!;
    _lactoseFree = widget.filters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme
                .of(context)
                .textTheme
                .headline5,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchTile(
                'Gluten-free',
                'Only include gluten free meals',
                _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchTile(
                'Lactose-free',
                'Only include lactose free meals',
                _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              _buildSwitchTile(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchTile(
                'Vegan',
                'Only include vegan meals',
                _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
