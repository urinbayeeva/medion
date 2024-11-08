part of "theme.dart";

class IconSet {
  final String medicalHistoryFirst;
  final String calendarFirst;
  final String folderFirst;
  final String phoneTwo;
  final String mail;
  final String left;
  final String home;
  final String filePlus;
  final String profile;
  final String calendar;
  final String other;
  final String homeActive;
  final String filePlusActive;
  final String profileActive;
  final String calendarActive;
  final String otherActive;
  final String notification;
  final String sliderFirstImage;
  final String right;
  final String location;
  final String medionIcon;
  final String nargiza;
  final String shoxrux;
  final String clock;
  final String address;
  final String bigCalendar;
  final String spine;
  final String breathing;
  final String urology;
  final String filter;
  final String search;

  IconSet._({
    required this.medicalHistoryFirst,
    required this.calendarFirst,
    required this.folderFirst,
    required this.phoneTwo,
    required this.mail,
    required this.left,
    required this.home,
    required this.filePlus,
    required this.profile,
    required this.calendar,
    required this.other,
    required this.homeActive,
    required this.otherActive,
    required this.filePlusActive,
    required this.profileActive,
    required this.calendarActive,
    required this.notification,
    required this.sliderFirstImage,
    required this.right,
    required this.location,
    required this.medionIcon,
    required this.nargiza,
    required this.shoxrux,
    required this.address,
    required this.clock,
    required this.bigCalendar,
    required this.spine,
    required this.breathing,
    required this.urology,
    required this.filter,
    required this.search,
  });

  static IconSet get create {
    return IconSet._(
      medicalHistoryFirst: "assets/icons/medical_history_1.svg",
      calendarFirst: "assets/icons/calendar_1.svg",
      folderFirst: "assets/icons/folder_1.svg",
      phoneTwo: "assets/icons/phone_two.svg",
      mail: "assets/icons/mail.svg",
      left: "assets/icons/left.svg",
      home: "assets/icons/home.svg",
      filePlus: "assets/icons/file_plus.svg",
      profile: "assets/icons/profile.svg",
      calendar: "assets/icons/calendar.svg",
      other: "assets/icons/other.svg",
      homeActive: "assets/icons/home_active.svg",
      otherActive: "assets/icons/other_active.svg",
      filePlusActive: "assets/icons/file_plus_active.svg",
      profileActive: "assets/icons/profile_active.svg",
      calendarActive: "assets/icons/calendar_active.svg",
      notification: "assets/icons/notification.svg",
      sliderFirstImage: "assets/images/slider_first_image.png",
      right: "assets/icons/right.svg",
      location: "assets/icons/location.svg",
      medionIcon: "assets/images/medion_inno.png",
      nargiza: "assets/images/nargiza.png",
      shoxrux: "assets/images/shoxrux.png",
      clock: "assets/icons/clock.svg",
      address: "assets/icons/address.svg",
      bigCalendar: "assets/icons/big_calendar.svg",
      spine: "assets/images/spine.png",
      breathing: "assets/images/breathing.png",
      urology: "assets/images/urlogoy.png",
      filter: "assets/icons/filter.svg",
      search: "assets/icons/search.svg",
    );
  }
}

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}

extension ImgExt on String {
  Image asset({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    Color? color,
  }) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      color: color,
    );
  }
}
