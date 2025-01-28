import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/appointment/component/service_selection_model.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SecondServicePage extends StatefulWidget {
  final int id;
  final bool? isAdded;
  final VoidCallback onTap;

  const SecondServicePage(
      {super.key, this.isAdded, required this.onTap, required this.id});

  @override
  State<SecondServicePage> createState() => _SecondServicePageState();
}

class _SecondServicePageState extends State<SecondServicePage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int chose = 0;
  int? selectedIndex;
  final List<dynamic> selectedServices = [];

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state.categoryServices.isEmpty) {
            return Center(
              child: Text(
                semanticsLabel: "no_result_found".tr(),
                "no_result_found".tr(),
                style: Style.headlineMain(),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomListView(
                    onRefresh: () async {

                      final selectedId =
                          context.read<BookingBloc>().state.selectedServiceId;

                      // Only fetch data if the state is not already loaded
                      if (state.categoryServices.isEmpty) {
                        context.read<BookingBloc>().add(
                              BookingEvent.fetchCategoryServices(
                                  id: selectedId!),
                            );
                      }
                      _refreshController.refreshCompleted();
                    },
                    refreshController: _refreshController,
                    padding: EdgeInsets.only(top: 16.w),
                    itemBuilder: (index, category) {
                      var item = state.categoryServices[index];
                      final isSelected = selectedIndex == index;

                      return CustomExpansionListTile(
                        title: item.name is bool ? "" : item.name.toString(),
                        description: item.services.isEmpty
                            ? 'no_services_available'.tr()
                            : 'services_list'.tr(),
                        children: item.services.map((service) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                          service.name,
                                          style: fonts.smallSemLink.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          service.description ??
                                              'no_description',
                                          style: fonts.smallLink.copyWith(
                                              color: colors.neutral600,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${service.priceUzs} UZS",
                                          style: fonts.smallLink.copyWith(
                                            color: colors.primary900,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AnimationButtonEffect(
                                    onTap: () {
                                      final selectedIds = selectedServices
                                          .map<int>(
                                              (service) => service.id as int)
                                          .toList();
                                      context.read<BookingBloc>().add(
                                          BookingEvent.selectInnerServiceID(
                                              ids: selectedIds));

                                      setState(() {
                                        if (selectedServices
                                            .contains(service)) {
                                          selectedServices.remove(service);
                                          chose--;
                                        } else {
                                          selectedServices.add(service);
                                          chose++;
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(12.w),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color:
                                            selectedServices.contains(service)
                                                ? colors.error500
                                                : colors.neutral200,
                                      ),
                                      child: selectedServices.contains(service)
                                          ? icons.check
                                              .svg(color: colors.shade0)
                                          : icons.plus
                                              .svg(color: colors.primary900),
                                    ),
                                  ),
                                ],
                              ),
                              8.h.verticalSpace,
                              Divider(
                                color: colors.neutral400,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),
                              8.h.verticalSpace,
                            ],
                          );
                        }).toList(),
                      );
                    },
                    data: state.categoryServices,
                    emptyWidgetModel: ErrorWidgetModel(title: "", subtitle: ""),
                    status: FormzSubmissionStatus.inProgress,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                width: double.infinity,
                color: chose >= 1 ? null : colors.shade0,
                decoration: chose >= 1
                    ? BoxDecoration(
                        color: colors.shade0,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r)),
                      )
                    : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (chose >= 1) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "count_services_selected".tr(
                              namedArgs: {"count": "$chose"},
                            ),
                            style: fonts.xSmallLink.copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.bold),
                          ),
                          AnimationButtonEffect(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                isScrollControlled: true,
                                enableDrag: true,
                                builder: (context) {
                                  return DraggableScrollableSheet(
                                    expand: false,
                                    builder: (BuildContext context,
                                        ScrollController scrollController) {
                                      return SingleChildScrollView(
                                        controller: scrollController,
                                        child: ServiceSelectionModal(
                                          selectedServices: selectedServices,
                                          chose: chose,
                                          onRemoveService: () {
                                            setState(() {
                                              selectedServices.removeWhere(
                                                  (service) => true);
                                              chose--;
                                            });
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: icons.right.svg(
                              width: 20.w,
                              height: 20.h,
                              color: colors.iconGreyColor,
                            ),
                          )
                        ],
                      ),
                      12.h.verticalSpace,
                    ],
                    CButton(
                      title: "next".tr(),
                      onTap: widget.onTap,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
