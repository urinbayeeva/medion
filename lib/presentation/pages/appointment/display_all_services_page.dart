import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/infrastructure/apis/api_service.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/component/custom_pagination.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DisplayAllServicesPage extends StatefulWidget {
  final VoidCallback? onTap;
  final int id;
  final Function(int) updateIdCallback; // Callback for updating the id

  const DisplayAllServicesPage(
      {super.key,
      this.onTap,
      required this.id,
      required this.updateIdCallback});

  @override
  State<DisplayAllServicesPage> createState() => _DisplayAllServicesPageState();
}

class _DisplayAllServicesPageState extends State<DisplayAllServicesPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final ApiService _apiService = ApiService();

  late int selectedId;

  @override
  void initState() {
    super.initState();

    selectedId = widget.id ?? 29;
    context.read<BookingBloc>().add(const BookingEvent.fetchBookingTypes());
    // context.read<BookingBloc>().add(BookingEvent.fetchCategoryServices(
    //     id: selectedId == 0 ? 29 : selectedId));
    _apiService.fetchCategoryServices(selectedId);
  }

  void _fetchServices(int id) {
    _apiService.fetchCategoryServices(id);
  }

  void _updateId(int newId) {
    if (selectedId != newId) {
      setState(() {
        selectedId = newId; 
      });
      _fetchServices(selectedId);
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state.bookingTypes.isEmpty) {
            return Center(
              child: Text(
                semanticsLabel: "no_result_found".tr(),
                "no_result_found".tr(),
                style: Style.headlineMain(),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomPagination(
              enablePullUp: false,
              controller: _refreshController,
              onRetry: () {
                context
                    .read<BookingBloc>()
                    .add(const BookingEvent.fetchBookingTypes());
                _refreshController.refreshCompleted();
              },
              child: ListView.builder(
                itemCount: state.bookingTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  final BookingTypeModel item = state.bookingTypes[index];
                  return MedicalDirectionItem(
                    title: item.name,
                    subtitle:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    iconPath: 'assets/icons/default_icon.png',
                    onTap: () {
                      setState(() {
                        selectedId = item.id;
                        _apiService.fetchCategoryServices(selectedId);
                      });
                      widget.updateIdCallback(item.id);
                      if (widget.onTap != null) {
                        widget.onTap!();
                      }
                      print("Selected item index: $selectedId");
                    },
                  );
                },
              ),
            ),
          );
        },
      );
    });
  }
}
