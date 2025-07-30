enum DoctorInfoEnum {
  about,
  experience,
  education,
  workTime,
  discount,
  achievements,
  gallery,
  reviews,
  articles;

  bool get isAbout => this == DoctorInfoEnum.about;

  bool get isDiscount => this == DoctorInfoEnum.discount;

  bool get isExperience => this == DoctorInfoEnum.experience;

  bool get isEducation => this == DoctorInfoEnum.education;

  bool get isWorkTime => this == DoctorInfoEnum.workTime;

  bool get isAchievements => this == DoctorInfoEnum.achievements;

  bool get isGallery => this == DoctorInfoEnum.gallery;

  bool get isReviews => this == DoctorInfoEnum.reviews;

  bool get isArticles => this == DoctorInfoEnum.articles;
}
