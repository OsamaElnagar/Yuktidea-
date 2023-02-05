

import 'package:flutter/material.dart';

bool? lastPage = false;
String? uId;
var postIndex;
var commentIndex ;
var storyIndex ;
bool wannaSearchForUser= false;
FocusNode modifyPostTextNode = FocusNode();

class MediaSource
{
  static String camera = 'Camera';
  static String gallery = 'gallery';
}

TextStyle labelStyle()
{
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600
  );
}

// void printFullText(String text) {
//   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
//   pattern.allMatches(text).forEach((match) => pint(match.group(0)));
// }
