import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
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

  @override
  void initState() {
    final selectedId = context.read<BookingBloc>().state.selectedServiceId;

    context
        .read<BookingBloc>()
        .add(BookingEvent.fetchCategoryServices(id: selectedId!));

    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final selectedId = context.read<BookingBloc>().state.selectedServiceId;
    if (selectedId != null) {
      context
          .read<BookingBloc>()
          .add(BookingEvent.fetchCategoryServices(id: selectedId));
    }
  }

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
                    onRefresh: () {
                      final selectedId =
                          context.read<BookingBloc>().state.selectedServiceId;

                      context.read<BookingBloc>().add(
                          BookingEvent.fetchCategoryServices(id: selectedId!));
                      setState(() {});
                      _refreshController.refreshCompleted();
                    },
                    refreshController: _refreshController,
                    padding: EdgeInsets.only(top: 16.w),
                    itemBuilder: (index, category) {
                      var item = state.categoryServices[index];

                      return CustomExpansionListTile(
                        title: item.name is bool ? "" : item.name.toString(),
                        description: item.services.isEmpty
                            ? 'no_services_available'.tr()
                            : 'services_list'.tr(),
                        children: item.services.map((service) {
                          return ListTile(
                            title: Text(
                              service.name,
                              style: fonts.smallSemLink.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              service.description ?? 'no_description',
                            ),
                            trailing: Text(
                              "${service.priceUzs} UZS",
                              style: fonts.smallLink.copyWith(
                                color: colors.primary900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                            "Выбраны $chose услуги",
                            style: fonts.xSmallLink.copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.bold),
                          ),
                          AnimationButtonEffect(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                      color: colors.shade0,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.r),
                                        topRight: Radius.circular(8.r),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Выбраны $chose услуги",
                                          style: fonts.xSmallLink.copyWith(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        4.h.verticalSpace,
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: icons.right.svg(
                                width: 20.w,
                                height: 20.h,
                                color: colors.iconGreyColor),
                          ),
                        ],
                      ),
                      12.h.verticalSpace,
                    ],
                    CButton(
                      title: "next".tr(),
                      onTap: widget.onTap,
                    ),
                    // 24.h.verticalSpace,
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
