enum AdsEnum {
  none(type: ""),
  news(type: "news"),
  article(type: "article"),
  equipment(type: "equipment"),
  discount(type: "discount"),
  blogHealth(type: "blog_health"),
  partner(type: "partner");

  final String type;

  const AdsEnum({required this.type});

  bool get isBlogHealth => this == AdsEnum.blogHealth;

  bool get isNews => this == AdsEnum.news;

  bool get isArticles => this == AdsEnum.article;

  bool get isEquipment => this == AdsEnum.equipment;

  bool get isDiscount => this == AdsEnum.discount;

  bool get isPartner => this == AdsEnum.partner;

  bool get isNone => this == AdsEnum.none;
}
