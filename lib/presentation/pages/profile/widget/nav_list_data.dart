import 'package:easy_localization/easy_localization.dart';
import 'package:medion/presentation/styles/theme.dart';

List<Map<String, dynamic>> navListData = [
  {
    "title": "personal_information".tr(),
    "icon": IconSet.create.user,
  },
  {
    "title": "my_results".tr(),
    "icon": IconSet.create.notepad,
  },
  {
    "title": "recommendations".tr(),
    "icon": IconSet.create.invoice,
  },
  {
    "title": "wallet".tr(),
    "icon": IconSet.create.wallet,
  },
  {
    "title": "settings".tr(),
    "icon": IconSet.create.settings,
  },
  {"title": "logout".tr(), "icon": IconSet.create.logOut}
];
