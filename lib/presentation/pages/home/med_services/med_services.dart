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
import 'package:medion/presentation/pages/appointment/appointment_page.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
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
            Expanded(child:
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              print(
                  "Medical services: ${state.medicalServices}"); // Debugging line
              if (state.medicalServices.isEmpty) {
                return const Center(
                    child: Text("No medical services available"));
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
                          iconPath: "",
                          onTap: () {
                            final categoryId =
                                state.medicalServices[index].categoryId;
                            final intId = categoryId is int
                                ? categoryId
                                : int.parse(categoryId.toString());
                            print(
                                " MEDICAL SERVICE ID ${int.parse(intId.toString())}");
                            Navigator.push(
                              context,
                              AppRoutes.getAppointmentPage(
                                1,
                                [int.parse(intId.toString())],
                              ),
                            ).then((value) {
                              if (value != null && value is Set<int>) {
                                setState(() {
                                  selectedServiceIds = value;
                                });
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                  60.h.verticalSpace,
                ],
              );
            }))
          ],
        ),
      );
    });
  }
}
