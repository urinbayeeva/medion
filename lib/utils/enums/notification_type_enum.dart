class NotificationTabs {
  final String title;
  final String subTitle;
  final String itemKey;
  final bool canSee;
  final NotificationTypeEnum checker;

  const NotificationTabs({
    required this.title,
    required this.subTitle,
    required this.itemKey,
    required this.canSee,
    required this.checker,
  });
}

enum NotificationTypeEnum {
  all(title: "all", keyWord: "", subTitle: ""),
  discount(title: "discounts", keyWord: "discount", subTitle: "Перейти к акции"),
  reminders(title: "reminder", keyWord: "info", subTitle: "Перейти к приёму"),
  reviews(title: "reviews", keyWord: "review", subTitle: ""),
  results(title: "result", keyWord: "lab_result", subTitle: ""),
  links(title: "link", keyWord: "link", subTitle: "Перейти");

  final String title;
  final String subTitle;
  final String keyWord;

  bool get isLink => this == NotificationTypeEnum.links;

  bool get isDiscount => this == NotificationTypeEnum.discount;

  bool get isReminder => this == NotificationTypeEnum.reminders;

  bool get isReview => this == NotificationTypeEnum.reviews;

  bool get isResult => this == NotificationTypeEnum.results;

  const NotificationTypeEnum({required this.title, required this.keyWord, required this.subTitle});
}
