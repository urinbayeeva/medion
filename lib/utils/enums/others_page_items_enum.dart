enum OthersPageItemsEnum {
  article,
  branch,
  equipment,
  aboutHealth,
  partner,
  awards,
  career,
  services,
  offer,
  activity,
  education,
  team,
  discount,
  feedback,
  checkUp,
  review,
  docs;

  bool get isCheckUp => this == OthersPageItemsEnum.checkUp;

  bool get isArticle => this == OthersPageItemsEnum.article;

  bool get isBranch => this == OthersPageItemsEnum.branch;

  bool get isEquipment => this == OthersPageItemsEnum.equipment;

  bool get isAboutHealth => this == OthersPageItemsEnum.aboutHealth;

  bool get isPartner => this == OthersPageItemsEnum.partner;

  bool get isAwards => this == OthersPageItemsEnum.awards;

  bool get isCareer => this == OthersPageItemsEnum.career;

  bool get isServices => this == OthersPageItemsEnum.services;

  bool get isOffer => this == OthersPageItemsEnum.offer;

  bool get isActivity => this == OthersPageItemsEnum.activity;

  bool get isEducation => this == OthersPageItemsEnum.education;

  bool get isTeam => this == OthersPageItemsEnum.team;

  bool get isDiscount => this == OthersPageItemsEnum.discount;

  bool get isFeedback => this == OthersPageItemsEnum.feedback;

  bool get isReview => this == OthersPageItemsEnum.review;

  bool get isDocs => this == OthersPageItemsEnum.docs;
}
