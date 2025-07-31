import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/enums/others_page_items_enum.dart';

class OthersPageData {
  final String title;
  final String icon;
  final OthersPageItemsEnum checker;

  const OthersPageData({
    required this.icon,
    required this.title,
    required this.checker,
  });
}

List<OthersPageData> second = <OthersPageData>[
  OthersPageData(
    icon: IconSet.create.discount,
    title: "discounts",
    checker: OthersPageItemsEnum.discount,
  ),
  OthersPageData(
    icon: IconSet.create.document,
    title: "documents",
    checker: OthersPageItemsEnum.docs,
  ),
  OthersPageData(
    icon: IconSet.create.readFeedbacks,
    title: "customers_reviews",
    checker: OthersPageItemsEnum.review,
  ),
  OthersPageData(
    icon: IconSet.create.leaveFeedbacks,
    title: "leave_feedback",
    checker: OthersPageItemsEnum.feedback,
  ),
];

List<OthersPageData> first = <OthersPageData>[
  OthersPageData(
    icon: IconSet.create.article,
    title: "articles",
    checker: OthersPageItemsEnum.article,
  ),
  OthersPageData(
    icon: IconSet.create.filial,
    title: "branches",
    checker: OthersPageItemsEnum.branch,
  ),
  OthersPageData(
    icon: IconSet.create.ctScan,
    title: "equipment",
    checker: OthersPageItemsEnum.equipment,
  ),
  OthersPageData(
    icon: IconSet.create.heartBeat,
    title: "about_health",
    checker: OthersPageItemsEnum.aboutHealth,
  ),
  OthersPageData(
    icon: IconSet.create.handshake,
    title: "partners",
    checker: OthersPageItemsEnum.partner,
  ),
  OthersPageData(
    icon: IconSet.create.badge,
    title: "achievments",
    checker: OthersPageItemsEnum.awards,
  ),
  OthersPageData(
    icon: IconSet.create.briefcase,
    title: "career",
    checker: OthersPageItemsEnum.career,
  ),
  OthersPageData(
    icon: IconSet.create.checkUp,
    title: "services",
    checker: OthersPageItemsEnum.services,
  ),
  OthersPageData(
    icon: IconSet.create.document,
    title: "offerta",
    checker: OthersPageItemsEnum.offer,
  ),
  OthersPageData(
    icon: IconSet.create.stethoscope,
    title: "our_activities",
    checker: OthersPageItemsEnum.activity,
  ),
  OthersPageData(
    icon: IconSet.create.book,
    title: "education",
    checker: OthersPageItemsEnum.education,
  ),
  OthersPageData(
    icon: IconSet.create.group,
    title: "team",
    checker: OthersPageItemsEnum.team,
  ),
];

// List<Map<String, String>> first = [
//   {
//     "title": "articles",
//     "icon": IconSet.create.article,
//   },
//   {
//     "title": "branches",
//     "icon": IconSet.create.filial,
//   },
//   {
//     "title": "equipment",
//     "icon": IconSet.create.ctScan,
//   },
//   {
//     "title": "about_health",
//     "icon": IconSet.create.heartBeat,
//   },
//   {
//     "title": "partners",
//     "icon": IconSet.create.handshake,
//   },
//   {
//     "title": "achievments",
//     "icon": IconSet.create.badge,
//   },
//   {
//     "title": "career",
//     "icon": IconSet.create.briefcase,
//   },
//   {
//     "title": "services",
//     "icon": IconSet.create.hospital,
//   },
//   {
//     "title": "offerta",
//     "icon": IconSet.create.document,
//   },
//   {
//     "title": "our_activities",
//     "icon": IconSet.create.stethoscope,
//   },
//   {
//     "title": "education",
//     "icon": IconSet.create.book,
//   },
//   {
//     "title": "team",
//     "icon": IconSet.create.group,
//   },
// ];
//
// List<Map<String, String>> othersData = [
//   if (AppConfig.shared.flavor == Flavor.dev) ...[
//     {
//       "title": "services",
//       "icon": IconSet.create.hospital,
//     },
//     {
//       "title": "training",
//       "icon": IconSet.create.book,
//     },
//     {
//       "title": "documents",
//       "icon": IconSet.create.document,
//     },
//     {
//       "title": "Check-up",
//       "icon": IconSet.create.checkUp,
//     },
//   ],
//   {
//     "title": "articles",
//     "icon": IconSet.create.article,
//   },
//   {
//     "title": "branches",
//     "icon": IconSet.create.filial,
//   },
//   {
//     "title": "equipment",
//     "icon": IconSet.create.ctScan,
//   },
//   {
//     "title": "about_health",
//     "icon": IconSet.create.heartBeat,
//   },
//   {
//     "title": "partners",
//     "icon": IconSet.create.handshake,
//   },
//   {
//     "title": "achievments",
//     "icon": IconSet.create.badge,
//   },
//   {
//     "title": "career",
//     "icon": IconSet.create.briefcase,
//   },
//   {
//     "title": "discounts",
//     "icon": IconSet.create.discounts,
//   },
//   {
//     "title": "services",
//     "icon": IconSet.create.hospital,
//   },
//   {
//     "title": "offerta",
//     "icon": IconSet.create.document,
//   },
//   {
//     "title": "our_activities",
//     "icon": IconSet.create.stethoscope,
//   },
//   {
//     "title": "education",
//     "icon": IconSet.create.book,
//   },
//   {
//     "title": "team",
//     "icon": IconSet.create.group,
//   },
//   {
//     "title": "customers_reviews",
//     "icon": IconSet.create.readFeedbacks,
//   },
//   {
//     "title": "leave_feedback",
//     "icon": IconSet.create.leaveFeedbacks,
//   },
//   {
//     "title": "documents",
//     "icon": IconSet.create.document,
//   },
// ];
//
// List<Map<String, dynamic>> othersDataSecond = [
//   if (AppConfig.shared.flavor != Flavor.dev) ...[
//     {
//       "title": "documents",
//       "icon": IconSet.create.document,
//     },
//     {
//       "title": "loyalty_program",
//       "icon": IconSet.create.stethoscope,
//     },
//     {
//       "title": "treatments_for_installments",
//       "icon": IconSet.create.monets,
//     },
//     {
//       "title": "for_corporate_clients",
//       "icon": IconSet.create.group,
//     },
//     {
//       "title": "treatment_according_to_fms",
//       "icon": IconSet.create.briefcase,
//     },
//     {
//       "title": "treatment_accortinf_to_dms",
//       "icon": IconSet.create.polis,
//     },
//     {
//       "title": "med_tourism",
//       "icon": IconSet.create.medTourism,
//     },
//   ],
//   {
//     "title": "discounts",
//     "icon": IconSet.create.discounts,
//   },
//   {
//     "title": "customers_reviews",
//     "icon": IconSet.create.readFeedbacks,
//   },
//   {
//     "title": "leave_feedback",
//     "icon": IconSet.create.leaveFeedbacks,
//   },
// ];
