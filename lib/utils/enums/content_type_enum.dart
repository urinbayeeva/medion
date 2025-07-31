enum ContentTypeEnum {
  article(title: "articles", itemKey: "article"),
  discount(title: "discounts", itemKey: "discount"),
  equipment(title: "equipment", itemKey: "equipment"),
  news(title: "news", itemKey: "news"),
  partner(title: "partners", itemKey: "partner"),
  blogHealth(title: "about_health", itemKey: "blog_health");

  const ContentTypeEnum({required this.title, required this.itemKey});

  final String title;
  final String itemKey;
}
