enum ContentEnum {
  aboutHealth,
  equipments,
  awards;

  bool get isHealth => this == ContentEnum.aboutHealth;

  bool get isEquipment => this == ContentEnum.equipments;

  bool get isAwards => this == ContentEnum.awards;
}
