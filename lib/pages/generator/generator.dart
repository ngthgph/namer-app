import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import 'local_widgets/generator_button.dart';
import 'local_widgets/other_widget.dart';

class GeneratorPage extends StatefulWidget {
  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  var styleSelected = 0;
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    String styledPair;
    String styleTitle;
    switch (styleSelected) {
      case 0:
        styledPair = pair.asLowerCase;
        styleTitle = 'camelCase';
      case 1:
        styledPair = pair.asCamelCase;
        styleTitle = 'PascalCase';
      case 2:
        styledPair = pair.asPascalCase;
        styleTitle = 'UPPERCASE';
      case 3:
        styledPair = pair.asUpperCase;
        styleTitle = 'lowercase';
      default:
        throw UnimplementedError('no String for $styleSelected');
    }

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    void onStyleChanging(styleSelected) {
      setState(() {
        if (styleSelected == 3) {
          styleSelected = 0;
        } else {
          styleSelected++;
        }
      });
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: styledPair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FavoriteButton(appState: appState, pair: pair, icon: icon),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  onStyleChanging(styleSelected);
                },
                child: Text(styleTitle),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
