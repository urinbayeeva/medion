import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/presentation/pages/booking/booking_second_page.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/styles/theme.dart';

class ShowSelectedService extends StatelessWidget {
  const ShowSelectedService({
    super.key,
    required this.bloc,
    required this.colors,
    required this.fonts,
    required this.icons,
  });

  final BookingBloc bloc;
  final CustomColorSet colors;
  final FontSet fonts;
  final IconSet icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BlocBuilder<BookingBloc, BookingState>(
        bloc: bloc,
        buildWhen: (o, n) {
          final length = o.services.length != n.services.length;
          return length;
        },
        builder: (context, state) {
          final List<BookingInfo> items = bloc.state.services;
          return Container(
            constraints: BoxConstraints(maxHeight: 400.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: colors.shade0,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (items.isNotEmpty) ...{
                      Text(
                        "count_services_selected".tr(namedArgs: {"count": "${items.length}"}),
                        style: fonts.smallTagSecond.copyWith(fontWeight: FontWeight.bold),
                      ),
                    } else ...{
                      Text(
                        "no_services_available".tr(),
                        style: fonts.smallTagSecond.copyWith(fontWeight: FontWeight.bold),
                      ),
                    },
                    if (items.isNotEmpty) ...{
                      WScaleAnimation(
                        onTap: () => bloc.add(const BookingEvent.removeAllService()),
                        child: Text("remove_all".tr(), style: fonts.smallTagSecond.copyWith(color: colors.error500)),
                      )
                    } else ...{
                      const SizedBox(),
                    }
                  ],
                ),
                10.h.verticalSpace,
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: items.length,
                    separatorBuilder: (c, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final BookingInfo info = items[index];
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: colors.shade0,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ListTile(
                          style: ListTileStyle.list,
                          title: Text(info.serviceName, style: fonts.regularMain),
                          subtitle: Text(
                            info.service.name ?? '',
                            style: fonts.xSmallMain,
                          ),
                          trailing: WScaleAnimation(
                            onTap: () {
                              bloc.add(BookingEvent.removeService(id: info.serviceId, service: info.service));
                            },
                            child: Icon(Icons.delete_forever_outlined, color: colors.error500),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
