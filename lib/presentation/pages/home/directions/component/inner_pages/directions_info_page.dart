import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_container.dart';
import 'package:medion/presentation/component/c_toggle.dart';
import 'package:medion/presentation/pages/home/directions/widgets/service_widget.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';

import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class DirectionInfoPage extends StatefulWidget {
  final int id;

  const DirectionInfoPage({super.key, required this.id});

  @override
  State<DirectionInfoPage> createState() => _DirectionInfoPageState();
}

class _DirectionInfoPageState extends State<DirectionInfoPage> {
  int selectedIndex = 0;
  double turns = 0.0;
  bool changeSum = false;
  List<int> savedIds = []; // List to hold the saved IDs

  Widget buildDoctorItem(dynamic doctor, bool isInnerPage) {
    return DoctorsItem(
      // isInnerPageUsed: isInnerPage,
      onTap: () {},
      name: doctor['name'],
      profession: doctor['profession'],
      experience: doctor['experience'],
      // imagePath: doctor['image'],
    );
  }

  @override
  void initState() {
    super.initState();
    context
        .read<BookingBloc>()
        .add(BookingEvent.fetchHomePageServiceDoctors(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(builder: (context, state) {
      final medicalModel = state.medicalModel;

      return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CAppBar(
                bordered: true,
                title: medicalModel!.services
                        .firstWhere(
                          (service) => service.id == widget.id,
                          orElse: () => medicalModel.services.first,
                        )
                        .name ??
                    "",
                centerTitle: true,
                onTap: () {
                  Navigator.pop(context);
                  context.read<BottomNavBarController>().changeNavBar(false);
                },
                isBack: true,
                trailing: Row(
                  children: [
                    AnimatedRotation(
                        turns: turns,
                        duration: const Duration(seconds: 1),
                        child: AnimationButtonEffect(
                            onTap: () {
                              setState(() {
                                turns += 2 / 4;
                                changeSum = !changeSum;
                              });
                            },
                            child: icons.valyutaChange
                                .svg(width: 20.w, height: 20.h))),
                    6.w.horizontalSpace,
                    icons.filter.svg(width: 20.w, height: 20.h)
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(12.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: CustomToggle(
                          iconList: [
                            'all_informations'.tr(),
                            'doctors'.tr(),
                            'services'.tr()
                          ]
                              .asMap()
                              .entries
                              .map((entry) => Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        entry.value,
                                        style: fonts.xSmallLink.copyWith(
                                          color: selectedIndex == entry.key
                                              ? colors.shade0
                                              : colors.primary900,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => selectedIndex = value),
                          current: selectedIndex,
                          values: const [0, 1, 2],
                          height: 38.h,
                          indicatorSize: Size(double.infinity, 40.h),
                          backgroundColor: colors.neutral200,
                          indicatorColor: colors.error500,
                          elevation: false,
                        ),
                      ),
                      if (selectedIndex == 0) ...[
                        12.h.verticalSpace,
                        Text('all_informations'.tr(),
                            style: fonts.regularSemLink),
                        12.h.verticalSpace,
                        CContainer(
                            text: state.medicalModel!.description ?? "Null"),
                        12.h.verticalSpace,
                        Text('doctors'.tr(), style: fonts.regularSemLink),
                        12.h.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.w,
                              mainAxisSpacing: 12.h,
                              childAspectRatio: 0.52,
                            ),
                            itemCount: state.medicalModel?.doctors.length ?? 0,
                            itemBuilder: (_, index) {
                              final doctor = state.medicalModel!.doctors[index];
                              return DoctorsItem(
                                isInnerPageUsed: true,
                                imagePath: doctor.image ?? icons.nonUser,
                                onTap: () {},
                                name: doctor.name ?? '',
                                profession:
                                    doctor.jobName ?? "null proffesion name",
                                experience:
                                    "${doctor.experienceYears ?? "null experience"}",
                              );
                            },
                          ),
                        ),
                        12.h.verticalSpace,
                        Text('services'.tr(), style: fonts.regularSemLink),
                        12.h.verticalSpace,
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: state.medicalModel!.services.length,
                            itemBuilder: (context, index) {
                              return ServiceWidget(
                                onTap: () {
                                  savedIds.add(widget.id);
                                },
                                consultInfo: medicalModel.services
                                        .firstWhere(
                                          (service) => service.id == widget.id,
                                          orElse: () =>
                                              medicalModel.services.first,
                                        )
                                        .name ??
                                    "",
                                consultPrice: changeSum
                                    ? "${medicalModel.services.firstWhere((service) => service.id == widget.id, orElse: () => medicalModel.services.first).priceUzs ?? 0} UZS"
                                    : "${medicalModel.services.firstWhere((service) => service.id == widget.id, orElse: () => medicalModel.services.first).priceUzd ?? 0} USD",
                              );
                            }),
                        80.h.verticalSpace,
                      ],
                      if (selectedIndex == 1) ...[
                        12.h.verticalSpace,
                        Text('doctors'.tr(), style: fonts.regularSemLink),
                        12.h.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.w,
                              mainAxisSpacing: 12.h,
                              childAspectRatio:
                                  0.54, // Adjust this value based on your card dimensions
                            ),
                            itemCount: state.medicalModel?.doctors.length ?? 0,
                            itemBuilder: (_, index) {
                              final doctor = state.medicalModel!.doctors[index];
                              return DoctorsItem(
                                isInnerPageUsed: true,
                                imagePath: doctor.image ?? icons.nonUser,
                                onTap: () {},
                                name: doctor.name ?? '',
                                profession:
                                    doctor.jobName ?? "null proffesion name",
                                experience:
                                    "${doctor.experienceYears ?? "null experience"}",
                              );
                            },
                          ),
                        ),
                        80.h.verticalSpace,
                      ],
                      if (selectedIndex == 2) ...[
                        12.h.verticalSpace,
                        Text('services'.tr(), style: fonts.regularSemLink),
                        12.h.verticalSpace,
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: state.medicalModel!.services.length,
                            itemBuilder: (context, index) {
                              return ServiceWidget(
                                onTap: () {
                                  savedIds.add(widget.id);
                                },
                                consultInfo: medicalModel.services
                                        .firstWhere(
                                          (service) => service.id == widget.id,
                                          orElse: () =>
                                              medicalModel.services.first,
                                        )
                                        .name ??
                                    "",
                                consultPrice: changeSum
                                    ? "${medicalModel.services.firstWhere((service) => service.id == widget.id, orElse: () => medicalModel.services.first).priceUzs ?? 0} UZS"
                                    : "${medicalModel.services.firstWhere((service) => service.id == widget.id, orElse: () => medicalModel.services.first).priceUzd ?? 0} USD",
                              );
                            }),
                        80.h.verticalSpace,
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
