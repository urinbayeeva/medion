import 'package:easy_localization/easy_localization.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/utils/app_config.dart';

List<Map<String, dynamic>> othersData = [
  if (AppConfig.shared.flavor == Flavor.dev) ...[
    {
      "title": "our_activities".tr(),
      "icon": IconSet.create.stethoscope,
    },
    {
      "title": "services".tr(),
      "icon": IconSet.create.hospital,
    },
    {
      "title": "team".tr(),
      "icon": IconSet.create.group,
    },
    {
      "title": "training".tr(),
      "icon": IconSet.create.book,
    },
    {
      "title": "documents".tr(),
      "icon": IconSet.create.document,
    },
    {
      "title": "Check-up",
      "icon": IconSet.create.checkUp,
    },
  ],
  {
    "title": "articles".tr(),
    "icon": IconSet.create.article,
  },
  {
    "title": "branches".tr(),
    "icon": IconSet.create.filial,
  },
  {
    "title": "equipment".tr(),
    "icon": IconSet.create.ctScan,
  },
  {
    "title": "about_health".tr(),
    "icon": IconSet.create.heartBeat,
  },
  {
    "title": "partners".tr(),
    "icon": IconSet.create.handshake,
  },
  {
    "title": "achievments".tr(),
    "icon": IconSet.create.badge,
  },
  {
    "title": "career".tr(),
    "icon": IconSet.create.briefcase,
  },
  {
    "title": "discounts".tr(),
    "icon": IconSet.create.discounts,
  },
  {
    "title": "services".tr(),
    "icon": IconSet.create.hospital,
  },
  {
    "title": "offerta",
    "icon": IconSet.create.document,
  },
];

List<Map<String, dynamic>> othersDataSecond = [
  if (AppConfig.shared.flavor == Flavor.dev) ...[
    {
      "title": "documents".tr(),
      "icon": IconSet.create.document,
    },
    {
      "title": "loyalty_program".tr(),
      "icon": IconSet.create.stethoscope,
    },
    {
      "title": "treatments_for_installments".tr(),
      "icon": IconSet.create.monets,
    },
    {
      "title": "for_corporate_clients".tr(),
      "icon": IconSet.create.group,
    },
    {
      "title": "treatment_according_to_fms".tr(),
      "icon": IconSet.create.briefcase,
    },
    {
      "title": "treatment_accortinf_to_dms".tr(),
      "icon": IconSet.create.polis,
    },
    {
      "title": "med_tourism".tr(),
      "icon": IconSet.create.medTourism,
    },
  ],
  {
    "title": "discounts".tr(),
    "icon": IconSet.create.discounts,
  },
  {
    "title": "customers_reviews".tr(),
    "icon": IconSet.create.readFeedbacks,
  },
  {
    "title": "leave_feedback".tr(),
    "icon": IconSet.create.leaveFeedbacks,
  },
];
