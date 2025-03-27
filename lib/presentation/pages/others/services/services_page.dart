import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    context.read<BookingBloc>().add(const BookingEvent.fetchBookingTypes());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "services".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            ),
            12.h.verticalSpace,
            BlocBuilder<BookingBloc, BookingState>(
                buildWhen: (previous, current) {
              return previous.selectedServiceId != current.selectedServiceId ||
                  previous.bookingTypes != current.bookingTypes;
            }, builder: (context, state) {
              if (state.bookingTypes.isEmpty) {
                return Center(
                  child: Text(
                    "no_result_found".tr(),
                    style: Style.headlineMain(),
                  ),
                );
              }
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                // padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: colors.shade0,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border(
                    bottom: BorderSide(width: 1, color: colors.neutral400),
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final BookingTypeModel item = state.bookingTypes[index];
                    return Column(
                      children: [
                        AnimationButtonEffect(
                          onTap: () {},
                          child: ListTile(
                            title: Text(item.name),
                            leading: icons.consultation
                                .svg(color: colors.neutral600),
                          ),
                        ),
                        if (index != state.bookingTypes.length - 1)
                          Divider(
                            color: colors.neutral400,
                            height: 1,
                          ),
                      ],
                    );
                  },
                ),
              );
            })
          ],
        ),
      );
    });
  }
}
