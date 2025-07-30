enum FeedBackStatus {
  moderation(ipKey: "draft", icon: "assets/icons/timer.svg", title: "Moderation"),
  published(ipKey: "published", icon: "", title: "Published"),
  blocked(ipKey: "rejected", icon: "assets/icons/Simplification.svg", title: "Blocked"),
  none(ipKey: "", icon: "", title: "");

  final String title;
  final String icon;
  final String ipKey;

  const FeedBackStatus({required this.title, required this.icon, required this.ipKey});

  bool get isModeration => this == FeedBackStatus.moderation;

  bool get isPublished => this == FeedBackStatus.published;

  bool get isBlocked => this == FeedBackStatus.blocked;

  bool get isNone => this == FeedBackStatus.none;
}
