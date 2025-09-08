import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/selected_provider.dart';
import 'package:medion/domain/models/payment_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/pages/appointment/component/service_selection_model.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_doctor_chose.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/enums/pop_up_status_enum.dart';
import 'package:medion/utils/extension/context_extension.dart';
import 'package:medion/utils/format_currency.dart';
import 'package:provider/provider.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  late final ValueNotifier<List<SelectedServices>> _serviceIds;
  late final ValueNotifier<List<RecommendationInfo>> _recommendations;

  @override
  void initState() {
    _serviceIds = ValueNotifier(<SelectedServices>[]);
    _recommendations = ValueNotifier(<RecommendationInfo>[]);
    context.read<AuthBloc>().add(const AuthEvent.fetchRecommendation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: colors.shade0,
            foregroundColor: colors.darkMode900,
            scrolledUnderElevation: 0,
            leading: WScaleAnimation(
              child: Icon(Icons.keyboard_arrow_left, size: 32.h),
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text("Recommendation", style: fonts.regularMain),
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final recommendation = state.recommendation;

              if (state.fetchRecommendationStatus.isInitial || state.fetchRecommendationStatus.isInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.fetchRecommendationStatus.isFailure || recommendation.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_results_found".tr()),
                  ),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: _serviceIds,
                      builder: (ctx, val, ch) {
                        return ListView.builder(
                          itemCount: recommendation.length,
                          itemBuilder: (context, index) {
                            var item = recommendation[index];
                            return Padding(
                              padding: EdgeInsets.only(top: (index == 0) ? 8.0 : 0.0),
                              child: CustomExpansionListTile(
                                title: "${item.serviceName}",
                                titleWidget: Column(
                                  spacing: 6,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${item.serviceName}", style: fonts.regularMain),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 4,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        icons.clock.svg(color: colors.error500, height: 18, width: 18),
                                        Text("${item.datetime}", style: fonts.xSmallMain),
                                      ],
                                    ),
                                    Text("${item.doctorName}", style: fonts.xSmallMain),
                                  ],
                                ),
                                children: item.recommendations!.map(
                                  (service) {
                                    final id = service.serviceId ?? -1;
                                    final isSelected = _serviceIds.value.contains(SelectedServices(serviceId: id));
                                    return Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(width: 1, color: Color(0xFFF2F2F3)),
                                          bottom: BorderSide(width: 1, color: Color(0xFFF2F2F3)),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 12.h),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${service.serviceName}",
                                                        style: fonts.smallSemLink.copyWith(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        (2 > 4)
                                                            ? "${formatNumber(service.price, isDecimal: true)} USD"
                                                            : "sum".tr(
                                                                namedArgs: {
                                                                  "amount": formatNumber(service.price, isDecimal: true)
                                                                },
                                                              ),
                                                        style: fonts.smallLink.copyWith(
                                                          color: colors.primary900,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 13.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                AnimationButtonEffect(
                                                  onTap: () {
                                                    final selectedService = SelectedServices(
                                                      serviceId: service.serviceId!,
                                                      orderDetailId: service.orderDetailId,
                                                    );

                                                    log("Service id: ${selectedService.serviceId}");
                                                    log("order id: ${selectedService.orderDetailId}");

                                                    if (!isSelected) {
                                                      _serviceIds.value = List.from(_serviceIds.value)
                                                        ..add(selectedService);
                                                      _recommendations.value = List.from(_recommendations.value)
                                                        ..add(service);
                                                    } else {
                                                      _serviceIds.value = List.from(_serviceIds.value)
                                                        ..remove(selectedService);
                                                      _recommendations.value = List.from(_recommendations.value)
                                                        ..remove(service);
                                                    }

                                                    // if (!isSelected) {
                                                    //   _serviceIds.value = List.from(_serviceIds.value)
                                                    //     ..add(service.serviceId!);
                                                    //   _recommendations.value = List.from(_recommendations.value)
                                                    //     ..add(service);
                                                    // } else {
                                                    //   _serviceIds.value = List.from(_serviceIds.value)
                                                    //     ..remove(service.serviceId!);
                                                    //   _recommendations.value = List.from(_recommendations.value)
                                                    //     ..remove(service);
                                                    // }
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(12.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8.r),
                                                      color: isSelected ? colors.error500 : colors.neutral200,
                                                    ),
                                                    child: isSelected
                                                        ? icons.check.svg(color: colors.shade0)
                                                        : icons.plus.svg(color: colors.primary900),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  if (recommendation.isNotEmpty) ...{
                    ValueListenableBuilder(
                      valueListenable: _serviceIds,
                      builder: (ctx, val, ch) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: colors.neutral300),
                              left: BorderSide(color: colors.neutral300),
                              right: BorderSide(color: colors.neutral300),
                            ),
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            color: colors.shade0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "count_services_selected".tr(namedArgs: {"count": "${_serviceIds.value.length}"}),
                                    style: fonts.xSmallLink.copyWith(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (_recommendations.value.isNotEmpty) ...{
                                    AnimationButtonEffect(
                                      onTap: () {
                                        if (_recommendations.value.isNotEmpty) {
                                          lookSelectedService(
                                            recommendations: _recommendations,
                                            serviceIds: _serviceIds,
                                            colors: colors,
                                            fonts: fonts,
                                          );
                                        }
                                      },
                                      child: icons.right.svg(width: 20.w, height: 20.h, color: colors.iconGreyColor),
                                    ),
                                  }
                                ],
                              ),
                              CButton(
                                backgroundColor: _serviceIds.value.isEmpty ? colors.neutral300 : colors.error500,
                                title: "next".tr(),
                                onTap: () {
                                  if (_serviceIds.value.isNotEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MedServiceDoctorChose(
                                          isHome: false,
                                          servicesIDes: _serviceIds.value,
                                        ),
                                      ),
                                    );
                                  } else {
                                    context.showPopUp(
                                      status: PopUpStatus.warning,
                                      message: "no_result_found".tr(),
                                      fonts: fonts,
                                      colors: colors,
                                      context: context,
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  }
                ],
              );
            },
          ),
        );
      },
    );
  }

  void lookSelectedService({
    required ValueNotifier<List<RecommendationInfo>> recommendations,
    required ValueNotifier<List<SelectedServices>> serviceIds,
    required CustomColorSet colors,
    required FontSet fonts,
  }) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
      useRootNavigator: true,
      useSafeArea: true,
      backgroundColor: colors.shade0,
      clipBehavior: Clip.none,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
        minHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      builder: (context) {
        return ValueListenableBuilder(
          valueListenable: serviceIds,
          builder: (ctx, val, child) {
            if (recommendations.value.isEmpty) {
              Navigator.of(context).pop();
            }
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Selected Services", style: fonts.regularMain.copyWith(fontSize: 14)),
                      WScaleAnimation(
                        onTap: () {
                          serviceIds.value = [];
                          recommendations.value = [];
                        },
                        child: Text(
                          "Remove all",
                          style: fonts.regularMain.copyWith(color: colors.error500, fontSize: 14),
                        ),
                      )
                    ],
                  );
                }

                final rec = _recommendations.value[index - 1];
                return SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 25,
                  child: Row(
                    children: [
                      Expanded(child: Text("${rec.serviceName}", style: fonts.regularMain)),
                      WScaleAnimation(
                        onTap: () {
                          // _serviceIds.value = List.from(_serviceIds.value)..remove(rec.serviceId!);
                          // _recommendations.value = List.from(_recommendations.value)..remove(rec);
                          _serviceIds.value = List.from(_serviceIds.value)
                            ..remove(SelectedServices(serviceId: rec.serviceId!, orderDetailId: rec.orderDetailId));

                          _recommendations.value = List.from(_recommendations.value)..remove(rec);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: colors.neutral300,
                          ),
                          child: const Icon(Icons.delete_forever_outlined),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: recommendations.value.length + 1,
            );
          },
        );
      },
    );
  }
}
