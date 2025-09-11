import 'package:app_links/app_links.dart';
import 'package:medion/infrastructure/services/log_service.dart';

/// Provides methods to manage dynamic links.
final class DynamicLinkService {
  DynamicLinkService._();

  static final instance = DynamicLinkService._();

  final _appLinks = AppLinks();

  /// Handle navigation if initial link is found on app start.
  Future<void> _checkInitialLink() async {
    final initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      _handleLinkData(initialLink);
    }
  }

  /// Handles the link navigation Dynamic Links.
  void _handleLinkData(Uri data) {
    final queryParams = data.pathSegments;
    LogService.i("_handleLinkData: $queryParams");
    if (queryParams.isNotEmpty) {}
  }
}
