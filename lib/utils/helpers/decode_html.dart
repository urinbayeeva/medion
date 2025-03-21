import 'package:html/parser.dart';

String decodeHtml(String? htmlString) {
  if (htmlString == null) return '';
  if (RegExp(r'<[^>]*>').hasMatch(htmlString)) {
    try {
      var document = parse(htmlString);
      return parse(document.body!.text).documentElement!.text;
    } catch (e) {
      return htmlString;
    }
  }
  return htmlString;
}