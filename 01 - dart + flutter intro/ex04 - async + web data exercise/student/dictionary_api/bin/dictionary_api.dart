import 'dart:io';

import 'package:dictionary_api/dictionary_api.dart' as dictionary_api;

void main() async {

  // GAME PLAN:
  //  1. collect user input from terminal
    print('What\'s the word you want to look up?');
    String word = stdin.readLineSync()!; // again: ! safe to use here; either command-line program exits before storing this value,
                                         // or we get a string, even if empty!
  /*
    2. pass that value on to form the complete API URL
    3. fetch the JSON (will make a generic helper function for url-string -> decoded JSON)
  */
  final definition = await dictionary_api.getWordDefinition(word);

  // -> (optional) store the data in a class with late-initialised fields & a constructor
    
  // 4. render the first definition out to terminal 
  print('\nWord            Definition');
  print('--------------  ---------------------------------------------------');
  print('${word}      ${definition}');
} 