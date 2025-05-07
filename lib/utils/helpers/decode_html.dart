import 'package:html/parser.dart' as html_parser;

String decodeHtml(String? htmlString) {
  if (htmlString == null || htmlString.isEmpty) return '';

  try {
    final document = html_parser.parse(htmlString);
    final text = document.body?.text ?? htmlString;

    return text
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(RegExp(r'\n\s*\n'), '\n')
        .trim();
  } catch (e) {
    // Fallback if HTML parsing fails
    return htmlString
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(RegExp(r'\n\s*\n'), '\n')
        .trim();
  }
}

String cleanDescription(String description) {
  return description
      .replaceAll(RegExp(r'\n{3,}'), '\n\n')
      .replaceAll(RegExp(r'^\n+'), '')
      .replaceAll(RegExp(r'\n+$'), '')
      .trim();
}
