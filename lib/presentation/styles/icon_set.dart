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
  final String valyutaChange;
  final String plus;
  final String check;
  final String cancel;
  final String payme;
  final String click;
  final String consultation;
  final String cosmentology;
  final String diagnostic;
  final String spa;
  final String tooth;
  final String article;
  final String badge;
  final String book;
  final String checkUp;
  final String ctScan;
  final String document;
  final String filial;
  final String group;
  final String handshake;
  final String hospital;
  final String stethoscope;
  final String heartBeat;
  final String briefcase;
  final String edit;
  final String user;
  final String notepad;
  final String invoice;
  final String wallet;
  final String settings;
  final String globe;
  final String phone;
  final String logOut;

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
    required this.valyutaChange,
    required this.plus,
    required this.check,
    required this.cancel,
    required this.payme,
    required this.click,
    required this.consultation,
    required this.cosmentology,
    required this.diagnostic,
    required this.spa,
    required this.tooth,
    required this.article,
    required this.badge,
    required this.book,
    required this.checkUp,
    required this.ctScan,
    required this.document,
    required this.filial,
    required this.group,
    required this.handshake,
    required this.hospital,
    required this.stethoscope,
    required this.heartBeat,
    required this.briefcase,
    required this.edit,
    required this.invoice,
    required this.notepad,
    required this.settings,
    required this.user,
    required this.wallet,
    required this.globe,
    required this.logOut,
    required this.phone,
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
      valyutaChange: "assets/icons/valyuta_change.svg",
      plus: "assets/icons/plus.svg",
      check: "assets/icons/check.svg",
      cancel: "assets/icons/cancel.svg",
      payme: "assets/images/payme_img.png",
      click: "assets/icons/click.svg",
      consultation: "assets/icons/consultation.svg",
      cosmentology: "assets/icons/cosmetology.svg",
      diagnostic: "assets/icons/diagnostic.svg",
      spa: "assets/icons/spa.svg",
      tooth: "assets/icons/tooth.svg",
      article: "assets/icons/article.svg",
      badge: "assets/icons/badge.svg",
      book: "assets/icons/book.svg",
      checkUp: "assets/icons/check_up.svg",
      ctScan: "assets/icons/ct_scan.svg",
      document: "assets/icons/document.svg",
      filial: "assets/icons/filial.svg",
      group: "assets/icons/group.svg",
      handshake: "assets/icons/handshake.svg",
      hospital: "assets/icons/hospital.svg",
      stethoscope: "assets/icons/stethoscope.svg",
      heartBeat: "assets/icons/heart_beat.svg",
      briefcase: "assets/icons/briefcase.svg",
      edit: "assets/icons/edit.svg",
      invoice: "assets/icons/invoice.svg",
      notepad: "assets/icons/notepad.svg",
      settings: "assets/icons/settings.svg",
      user: "assets/icons/user.svg",
      wallet: "assets/icons/wallet.svg",
      globe: "assets/icons/globe.svg",
      logOut: "assets/icons/log_out.svg",
      phone: "assets/icons/phone.svg",
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
