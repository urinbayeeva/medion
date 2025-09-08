enum OrderPaymentTypeEnum {
  creditCard(apiKey: "", title: "credit_card", icon: "assets/images/Credit card.png"),
  cash(apiKey: "Cash", title: "cash", icon: "assets/images/Cash.png"),
  bank(apiKey: "", title: "bank", icon: "assets/images/Bank.png"),
  acquiring(apiKey: "", title: "acquiring", icon: "assets/images/Acquiring.png");

  const OrderPaymentTypeEnum({
    required this.title,
    required this.icon,
    required this.apiKey,
  });

  final String title;
  final String apiKey;
  final String icon;
}
