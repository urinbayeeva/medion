import 'package:equatable/equatable.dart';
import 'package:medion/infrastructure/services/alice/model/alice_http_error.dart';
import 'package:medion/infrastructure/services/alice/model/alice_http_request.dart';
import 'package:medion/infrastructure/services/alice/model/alice_http_response.dart';

/// Definition of http calls data holder.
// ignore: must_be_immutable
class AliceHttpCall with EquatableMixin {
  AliceHttpCall(this.id);

  final int id;
  final DateTime createdTime = DateTime.now();
  String client = '';
  bool loading = true;
  bool secure = false;
  String method = '';
  String endpoint = '';
  String server = '';
  String uri = '';
  int duration = 0;

  AliceHttpRequest? request;
  AliceHttpResponse? response;
  AliceHttpError? error;

  @override
  List<Object?> get props => [
        id,
        createdTime,
        client,
        loading,
        secure,
        method,
        endpoint,
        server,
        uri,
        duration,
        request,
        response,
        error,
      ];
}
