import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/selected_provider.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServicesChosePage extends StatefulWidget {
  final String serviceName;
  final int id;
  const ServicesChosePage({
    super.key,
    required this.serviceName,
    required this.id,
  });

  @override
  State<ServicesChosePage> createState() => _ServicesChosePageState();
}

class _ServicesChosePageState extends State<ServicesChosePage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  late final SelectedServiceIdsProvider _serviceIdsProvider;
  late final SelectedServicesProvider _servicesProvider;
  int selectedCount = 0;
  List<dynamic> selectedServices = [];
  final List<int> selectedServiceIDCatch = [];

  @override
  void initState() {
    super.initState();
    context.read<BookingBloc>().add(
          BookingEvent.fetchCategoryServices(id: widget.id),
        );
    _serviceIdsProvider =
        Provider.of<SelectedServiceIdsProvider>(context, listen: false);
    _servicesProvider =
        Provider.of<SelectedServicesProvider>(context, listen: false);
    _serviceIdsProvider.addListener(_updateSelectedServices);
    _updateSelectedServices();
  }

  @override
  void dispose() {
    _serviceIdsProvider.removeListener(_updateSelectedServices);
    _refreshController.dispose();
    super.dispose();
  }

  void _updateSelectedServices() {
    if (!mounted) return;
    final bookingState = context.read<BookingBloc>().state;
    setState(() {
      selectedServices = bookingState.categoryServices
          .expand((category) => category.services)
          .where((service) =>
              _serviceIdsProvider.selectedServiceIds.contains(service.id))
          .toList();
      selectedCount = selectedServices.length;
      selectedServiceIDCatch.clear();
      selectedServiceIDCatch.addAll(_serviceIdsProvider.selectedServiceIds);
    });
  }

  void _onRefresh() async {
    context.read<BookingBloc>().add(
          BookingEvent.fetchCategoryServices(id: widget.id),
        );
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "      ${widget.serviceName}",
              isBack: true,
              centerTitle: true,
              trailing: Row(
                children: [
                  AnimationButtonEffect(
                    onTap: () {},
                    child: icons.search.svg(width: 20.w, height: 20.h),
                  ),
                  12.w.horizontalSpace,
                  AnimationButtonEffect(
                    onTap: () {},
                    child: icons.valyutaChange.svg(width: 20.w, height: 20.h),
                  ),
                ],
              ),
            ),
            BlocConsumer<BookingBloc, BookingState>(
              listener: (context, state) {
                if (state.categoryServices.isNotEmpty) {
                  _updateSelectedServices();
                }
              },
              builder: (context, state) {
                if (state.categoryServices.isEmpty) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    itemCount: state.categoryServices.length,
                    itemBuilder: (context, categoryIndex) {
                      final category = state.categoryServices[categoryIndex];
                      return Container(
                        decoration: BoxDecoration(
                          color: colors.shade0,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                ...category.services.map((service) {
                                  return _ServiceItem(
                                    service: service,
                                    colors: colors,
                                    fonts: fonts,
                                    icons: icons,
                                    isSelected: _serviceIdsProvider
                                        .selectedServiceIds
                                        .contains(service.id),
                                    onTap: () {
                                      // _serviceIdsProvider
                                      //     .toggleServiceId(service.id);
                                      // _servicesProvider
                                      //     .toggleService(service);
                                    },
                                  );
                                }).toList(),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

class _ServiceItem extends StatelessWidget {
  final dynamic service;
  final dynamic colors;
  final dynamic fonts;
  final dynamic icons;
  final bool isSelected;
  final VoidCallback onTap;

  const _ServiceItem({
    required this.service,
    required this.colors,
    required this.fonts,
    required this.icons,
    required this.isSelected,
    required this.onTap,
  });

  // ... (keep the existing formatNumber method)

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: colors.neutral200),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name ?? '',
                      style: fonts.smallSemLink.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        service.description ?? 'Test description',
                        style: fonts.smallLink.copyWith(
                          color: colors.neutral600,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      service.priceUzs.toString(),
                      style: fonts.smallLink.copyWith(
                        color: colors.primary900,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    4.h.verticalSpace,
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: isSelected ? colors.primary500 : colors.neutral200,
                ),
                child: SvgPicture.asset(
                  isSelected
                      ? "assets/icons/check.svg"
                      : "assets/icons/plus.svg",
                  color: isSelected ? Colors.white : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
