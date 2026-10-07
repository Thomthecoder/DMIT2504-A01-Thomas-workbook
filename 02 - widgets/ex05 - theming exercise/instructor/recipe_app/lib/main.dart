import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // If I want to reference the color scheme in component-specific props in the theme data,
    // I need to create the colorScheme ahead of time, otherwise it's being created at the same time as
    // other ThemeData props are trying to reference it.
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.pink,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      theme: ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.primaryContainer,
        textTheme: TextTheme(
          // I want centralised styling for my text (see 'red side' of diff for potential pitfalls),
          // so basically what I'm doing is creating 'bootstrap-like' reusable classes that I'm going to
          // slap onto various text fields wherever they appear (including outside this component's direct scope).
          headlineLarge: TextStyle(
            fontSize: 44,
            color: colorScheme.primary,
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: colorScheme.secondary,
          ),
        ),
        // in class, we talked about considering the difference between e.g.
        // using a primary colour directly, or things like primaryContainer, onPrimary, etc. (see docs),
        // and helps illustrate why it's important to consider those relationships (play with component <-> colours)

      ),
      home: RecipePage(),
    );
  }
}


class RecipePage extends StatelessWidget {

  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // like a flexbox!
                            // .stretch alignment means children fill the entire width
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'my cool recipe app',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Image.asset(
            'assets/images/cool.jpg',
            height: 480,
          ),
          const ListWithHeading(
            heading: "Ingredients",
            listItems: [
              "- some ingredient",
              "- some ingredient",
              "- some ingredient",
              "- some ingredient",
              "- some ingredient",
            ]
          ),
          const ListWithHeading(
            heading: "Instructions",
            listItems: [
              '1. take your cream and behold it',
              '2. whip it good',
              '3. dip a strawberry',
            ]
          ),
        ],
      ),
    );
  }

}


// I notice that the Ingredients & Instructions 'shapes' are identical,
// so I can make one component to reuse for both those purposes.
class ListWithHeading extends StatelessWidget {
  // 1. I need a constructor (input params: super.key, heading, and list<str>)
  const ListWithHeading({
    super.key,
    required this.heading,
    required this.listItems,
  });

  // 2. I need class attributes for heading & items
  final String       heading;
  final List<String> listItems;

  // 3. I need to write a build method that returns that group of elements
  @override
  Widget build(BuildContext context) {
    // I basically just take what I had inline and paste it here
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // default x-axis align will be centering
        children: [
          Text(
            heading,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          for (final item in listItems) Text(item),
        ],
      ),
    );
  }
}
