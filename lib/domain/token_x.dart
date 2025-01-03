
import 'package:medion/domain/common/token.dart';

extension TokenX on Token {
  // AuthFailure? get hasFailure {
  //   if (accessToken == null && refreshToken == null) {
  //     return const AuthFailure.unAuthenticated();
  //   } else {
  //     return null;
  //   }
  // }

  String get toToken {
    return accessToken ?? '';
  }

  String? get toBearerToken {
    if (accessToken != null) {
      return "Bearer $accessToken";
    }
    return null;
  }
}
