import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

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
    switch(styleSelected) {
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

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: styledPair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(styleSelected == 3) {
                    styleSelected = 0;
                  } else {
                    styleSelected++;
                  }
                  });
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

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final String pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair,
          style: style,
          semanticsLabel: pair,
        ),
      ),
    );
  }
}
