import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DisplayAllServicesPage extends StatefulWidget {
  final VoidCallback? onTap;

  const DisplayAllServicesPage({super.key, this.onTap});

  @override
  State<DisplayAllServicesPage> createState() => _DisplayAllServicesPageState();
}

class _DisplayAllServicesPageState extends State<DisplayAllServicesPage> {
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
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state.bookingTypes.isEmpty) {
          return Center(
            child: Text(
              "no_result_found".tr(),
              style: Style.headlineMain(),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: state.bookingTypes.length,
          itemBuilder: (context, index) {
            final BookingTypeModel item = state.bookingTypes[index];
            return MedicalDirectionItem(
              title: item.name,
              subtitle: "Description",
              iconPath: 'assets/icons/default_icon.png',
              onTap: () {
                // Dispatch the selected ID to the Bloc
                context.read<BookingBloc>().add(BookingEvent.selectService(id: item.id));
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
            );
          },
        );
      },
    );
  }
}
