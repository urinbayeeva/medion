import 'package:medion/presentation/styles/theme.dart';

enum NavListItemEnum {
  info(title: _infoTitle, icon: _info),
  result(title: _resultsTitle, icon: _results),
  recipes(title: _recipeTitle, icon: _recipe),
  recommendation(title: _recommendationTitle, icon: _recommendation),
  wallet(title: _walletTitle, icon: _wallet),
  notification(title: _notificationTitle, icon: _notification),
  settings(title: _settingsTitle, icon: _settings);

  final String Function() title;
  final String Function() icon;

  bool get isNotification => this == NavListItemEnum.notification;

  static String _info() => IconSet.create.user;

  static String _results() => IconSet.create.notepad;

  static String _recipe() => IconSet.create.invoice;

  static String _recommendation() => IconSet.create.comment;

  static String _wallet() => IconSet.create.wallet;

  static String _notification() => IconSet.create.notification;

  static String _settings() => IconSet.create.settings;

  static String _infoTitle() => "personal_information";

  static String _resultsTitle() => "my_results";

  static String _recipeTitle() => "recipe";

  static String _recommendationTitle() => "Recommendation";

  static String _walletTitle() => "wallet";

  static String _notificationTitle() => "notifications";

  static String _settingsTitle() => "settings";

  const NavListItemEnum({required this.title, required this.icon});
}
