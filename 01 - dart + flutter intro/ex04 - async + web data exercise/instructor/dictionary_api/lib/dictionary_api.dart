import 'dart:convert';
import 'package:http/http.dart' as http; // import {pkgPath} as {name} lets you call things explicitly!
                                         // e.g. http.get() rather than just get() 

// - We want all our HTTP interaction to be async, so we have to return a Future<T>
// - valid JSON can be of a variety of top-level types (e.g. {}, []) so our return type is "dynamic" (dart's version of Any)
Future<dynamic> getJSON(String urlString) async {
  final Uri url  = Uri.parse(urlString);  // parse the URL into a safe/confirmed type
  final response = await http.get(url);   // http package fires only async HTTP requests, so we await
  return jsonDecode(response.body);
}

// Now that I have that generic function, I can make life easier for myself by making endpoint-specific functions
// that wrap around getJSON:

String API_BASE_URL = 'https://freedictionaryapi.com/api/v1';

Future<String> getWordDefinition(String word) async {
  final urlString = '${API_BASE_URL}/entries/en/${word}';
  var data        = await getJSON(urlString);
  return data['entries'][0]['senses'][0]['definition'];
}