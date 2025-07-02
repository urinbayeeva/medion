import 'dart:ui';





//             ("cancelled", "Cancelled"),

//             ("draft", "Draft"),



enum VisitListEnum {
  ordered(title: "Ordered", color: Color(0xff63B9F8)),
  confirmed(title: "Confirmed", color: Color(0xffFFA41B)),
  consulted(title: "Consulted", color: Color(0xff1CB57A)),
  registered(title: "Registered", color: Color(0xff8469F6)),
  cancelled(title: "Canceled", color: Color(0xff8E9BA8)),
  deleted(title: "Deleted", color: Color(0xffff0000)),
  diagnosed(title: "Diagnosed", color: Color(0xfff47104)),
  treated(title: "Treated", color: Color(0xff12d307)),
  discharged(title: "Discharged", color: Color(0xff3a5573)),
  draft(title: "Draft", color: Color(0xff3e3b3b)),
  reserved(title: "Reserved", color: Color(0xff0964bc));

  final Color color;
  final String title;

  bool get isCancel => this == VisitListEnum.cancelled;

  const VisitListEnum({required this.title, required this.color});
}
