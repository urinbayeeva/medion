import 'package:easy_localization/easy_localization.dart';

enum RatingEnum {
  first(value: 1, title: "1+"),
  second(value: 2, title: "2+"),
  third(value: 3, title: "3+"),
  fourth(value: 4, title: "4+");

  final String title;
  final int value;

  const RatingEnum({required this.title, required this.value});
}

enum FilterIntervalEnum {
  now("now"),
  daily("daily"),
  weekly("weekly"),
  monthly("monthly"),
  threeMonth("threeMonth"),
  halfYear("halfYear"),
  year("annual");

  final String title;

  const FilterIntervalEnum(this.title);

  /// Format helper
  String _format(DateTime dt) => DateFormat('yyyy-MM-dd').format(dt);

  /// Start time (calculated based on enum value)
  String get startTime {
    final now = DateTime.now();
    switch (this) {
      case FilterIntervalEnum.now:
        return _format(now);
      case FilterIntervalEnum.daily:
        return _format(now.subtract(const Duration(days: 1)));
      case FilterIntervalEnum.weekly:
        return _format(now.subtract(const Duration(days: 7)));
      case FilterIntervalEnum.monthly:
        return _format(DateTime(now.year, now.month - 1, now.day));
      case FilterIntervalEnum.threeMonth:
        return _format(DateTime(now.year, now.month - 3, now.day));
      case FilterIntervalEnum.halfYear:
        return _format(DateTime(now.year, now.month - 6, now.day));
      case FilterIntervalEnum.year:
        return _format(DateTime(now.year - 1, now.month, now.day));
    }
  }

  /// End time (always today in your case)
  String get endTime {
    final now = DateTime.now();
    return _format(now);
  }
}
