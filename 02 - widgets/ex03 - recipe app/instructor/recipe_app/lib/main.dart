import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    const mainHeadingStyle    = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Column(
          spacing: 10.0,
          crossAxisAlignment: CrossAxisAlignment.stretch, // stretch basically givesd you flexbox logic
                                                          // .stretch alignment means children fill entire width
          children: [

            Padding(
              padding: EdgeInsets.all(16.0),
              child: const Text(
                "my cool recipe app",
                textAlign: TextAlign.center,
                style: mainHeadingStyle,
              ),
            ),

            Image.asset(
              'assets/images/cool.jpg',
              height: 400,
            ),

            ListWithHeading(
              heading: "Ingredients",
              listItems: [
                "- 500g eye of newt",
                "- 150g fang of bat",
                "- 1/4 cup salted butter",
                "- 5lbs whey protein isolate",
              ]
            ),

            ListWithHeading(
              heading: "Instructions",
              listItems: [
                  "1. click heels three times",
                  "2. mix all ingredients",
                  "3. dunk face in mixture",
                  "4. serve (chilled)",
              ]
            ),

          ],  
        ),
      ),
    );
  }
}

/* I notice that the Ingredients and Instructions sections' structure are identical,
   which means I can create a reusable component.
*/
class ListWithHeading extends StatelessWidget {
  // What do I need in here? What input requirements, what goals to fulfill?

  // 1. I need a constructor, which takes in a String for heading + a List<String> for list items + super.key
  const ListWithHeading({
    super.key,
    required this.heading,
    required this.listItems,
  });
  
  // 2. I need class attributes for heading + contents to store the inputs
  final String       heading;
  final List<String> listItems;

  static const sectionHeadingStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  // 3. I need a build method to create the actual element tree, which I'm just going to yoink from the existing code.
  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text(
            heading,
            textAlign: TextAlign.center,
            style: sectionHeadingStyle,
          ),

          for (final item in listItems) Text(item),
        ],
      ),
    );
  }


}