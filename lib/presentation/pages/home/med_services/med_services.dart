import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/home/home_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart'
    show AnimationButtonEffect;
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/cached_image_component.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/component/shimmer_view.dart';
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/appointment/component/service_selection_model.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_choose.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MedServicesPage extends StatefulWidget {
  const MedServicesPage({super.key});

  @override
  State<MedServicesPage> createState() => _MedServicesPageState();
}

class _MedServicesPageState extends State<MedServicesPage> {
  Set<int>? selectedServiceIds;
  int chose = 0;

  @override
  void initState() {
    context.read<HomeBloc>().add(const HomeEvent.fetchMedicalServices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "med_services".tr(),
              isBack: true,
              centerTitle: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  print("Medical services: ${state.medicalServices}");
                  if (state.loading || state.medicalServices.isEmpty) {
                    return _buildShimmerView(colors);
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: state.medicalServices.length,
                          itemBuilder: (context, index) {
                            return MedicalDirectionItem(
                              title: state.medicalServices[index].title,
                              subtitle: state.medicalServices[index].info,
                              iconPath: state.medicalServices[index].image,
                              onTap: () {
                                final categoryId =
                                    state.medicalServices[index].categoryId;
                                final intId = categoryId is int
                                    ? categoryId
                                    : int.parse(categoryId.toString());
                                print("MEDICAL SERVICE ID $intId");
                                context
                                    .read<BottomNavBarController>()
                                    .changeNavBar(true);
                                Navigator.push(
                                  context,
                                  AppRoutes.getDirectionInfoPage(
                                    id: intId,
                                    name: state.medicalServices[index].title,
                                  ),
                                ).then((_) {
                                  context
                                      .read<BottomNavBarController>()
                                      .changeNavBar(false);
                                });
                              },
                            );
                          },
                        ),
                      ),
                      60.h.verticalSpace,
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildShimmerView(dynamic colors) {
    return ShimmerView(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: 5, // Show 5 placeholders
        itemBuilder: (context, index) {
          return ShimmerContainer(
            height: 100.h, // Adjust to match MedicalDirectionItem height
            borderRadius: 8.r,
            margin: EdgeInsets.only(bottom: 12.h),
          );
        },
      ),
    );
  }
}
