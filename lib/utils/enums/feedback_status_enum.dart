enum FeedBackStatus {
  moderation(icon: "assets/icons/timer.svg", title: "Moderation"),
  published(icon: "", title: "Published"),
  blocked(icon: "assets/icons/Simplification.svg", title: "Blocked"),
  none(icon: "", title: "");

  final String title;
  final String icon;

  const FeedBackStatus({required this.title, required this.icon});

  bool get isModeration => this == FeedBackStatus.moderation;

  bool get isPublished => this == FeedBackStatus.published;

  bool get isBlocked => this == FeedBackStatus.blocked;

  bool get isNone => this == FeedBackStatus.none;
}
