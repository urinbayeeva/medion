import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:html/parser.dart';

class HtmlDecodeInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    final request = chain.request;
    final response = await chain.proceed(request);

    if (response.isSuccessful) {
      final body = response.body;

      if (body is Map<String, dynamic>) {
        final decodedBody = _decodeHtmlInMap(body);
        return response.copyWith(body: decodedBody as BodyType);
      } else if (body is List) {
        final decodedBody = body.map((item) {
          if (item is Map<String, dynamic>) {
            return _decodeHtmlInMap(item);
          }
          return item;
        }).toList();
        return response.copyWith(body: decodedBody as BodyType);
      }
    }
    return response;
  }

  Map<String, dynamic> _decodeHtmlInMap(Map<String, dynamic> map) {
    final decodedMap = Map<String, dynamic>.from(map);
    decodedMap.forEach((key, value) {
      if (value is String && _containsHtml(value)) {
        decodedMap[key] = _decodeHtml(value);
      }
    });
    return decodedMap;
  }

  String _decodeHtml(String htmlString) {
    var document = parse(htmlString);
    return parse(document.body!.text).documentElement!.text;
  }

  bool _containsHtml(String input) {
    return RegExp(r'<[^>]*>').hasMatch(input);
  }
}
