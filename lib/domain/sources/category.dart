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
        return 'Все';
      case Category.gynecology:
        return 'Гинекология';
      case Category.cardiology:
        return 'Кардиология';
      case Category.ophthalmology:
        return 'Офтальмология';
      case Category.neurology:
        return 'Неврология';
      case Category.pediatric:
        return 'Детские';
    }
  }
}
