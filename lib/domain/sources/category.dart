import 'package:easy_localization/easy_localization.dart';

enum Category {
  all,
  gynecology,
  cardiology,
  ophthalmology,
  neurology,
  pediatric,
}

extension CategoryExtension on Category {
  String get displayName {
    switch (this) {
      case Category.all:
        return 'all'.tr();
      case Category.gynecology:
        return 'gynecology'.tr();
      case Category.cardiology:
        return 'cardyology'.tr();
      case Category.ophthalmology:
        return 'ophthalmology'.tr();
      case Category.neurology:
        return 'neurology'.tr();
      case Category.pediatric:
        return 'childre'.tr();
    }
  }
}
