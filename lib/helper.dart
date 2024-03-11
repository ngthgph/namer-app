import 'package:english_words/english_words.dart';

class Helper {

  static List<WordPair> convertToWordPairList(List<String> stringList) {

    var pairs = <WordPair>[];

    for(var string in stringList) {
      var first = getSubstringsByUpperCase(string).first;
      var last = getSubstringsByUpperCase(string).last;
      pairs.add(WordPair(first, last));
    }
    return pairs;
  }

  static List<String> getSubstringsByUpperCase(String str) {
    int upperCaseIndex =
        str.split('').indexWhere((char) => char == char.toUpperCase());

    String firstSubstring = str.substring(0, upperCaseIndex);
    String secondSubstring = str.substring(upperCaseIndex).toLowerCase();
    return [firstSubstring, secondSubstring];
  }
}