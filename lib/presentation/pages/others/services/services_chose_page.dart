import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
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
  bool _isSearching = false;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  // Service selection state
  int chose = 0;
  final Set<int> selectedServiceIDCatch = {};
  final List<Map<String, dynamic>> selectedServices = [];

  @override
  void initState() {
    super.initState();
    _loadServices();
  }

  void _loadServices() {
    context.read<BookingBloc>().add(
          BookingEvent.fetchCategoryServices(id: widget.id),
        );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    _loadServices();
    _refreshController.refreshCompleted();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchQuery = '';
        _searchController.clear();
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _searchFocusNode.requestFocus();
        });
      }
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  List<dynamic> _filterServices(List<dynamic> categories, String query) {
    if (query.isEmpty) return categories;

    return categories.where((category) {
      return category.services.any((service) {
        final nameMatch =
            service.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
        final descMatch =
            service.description?.toLowerCase().contains(query.toLowerCase()) ??
                false;
        return nameMatch || descMatch;
      });
    }).toList();
  }

  void _handleServiceSelection(Map<String, dynamic> service) {
    setState(() {
      final serviceId = service['id'] as int;
      if (selectedServiceIDCatch.contains(serviceId)) {
        selectedServiceIDCatch.remove(serviceId);
        selectedServices.removeWhere((s) => s['id'] == serviceId);
        chose--;
      } else {
        selectedServiceIDCatch.add(serviceId);
        selectedServices.add(service);
        chose++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            // Search or AppBar
            _isSearching
                ? _buildSearchBar(colors, fonts, icons)
                : _buildAppBar(colors, fonts, icons),

            // Services List
            Expanded(
              child: BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  if (state.categoryServices.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final filteredCategories = _filterServices(
                    state.categoryServices,
                    _searchQuery,
                  );

                  return SmartRefresher(
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    child: ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, categoryIndex) {
                        final category = filteredCategories[categoryIndex];
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
                                      isSelected: selectedServiceIDCatch
                                          .contains(service['id']),
                                      onTap: () =>
                                          _handleServiceSelection(service),
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
            ),

            // Bottom action bar
            if (chose > 0) _buildBottomActionBar(colors, fonts),
          ],
        ),
      );
    });
  }

  Widget _buildSearchBar(dynamic colors, dynamic fonts, dynamic icons) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        right: 16.w,
        left: 16.w,
      ),
      child: Row(
        children: [
          AnimationButtonEffect(
            onTap: _toggleSearch,
            child: icons.left
                .svg(height: 28.r, width: 28.r, color: colors.shade100),
          ),
          8.w.horizontalSpace,
          Expanded(
            child: CupertinoSearchTextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              placeholder: 'search_services'.tr(),
              onChanged: _onSearchChanged,
              prefixIcon: Icon(CupertinoIcons.search, color: colors.neutral600),
              suffixIcon: Icon(CupertinoIcons.xmark_circle_fill,
                  color: colors.neutral600),
              style: fonts.smallLink.copyWith(color: colors.primary900),
              decoration: BoxDecoration(
                color: colors.shade0,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(dynamic colors, dynamic fonts, dynamic icons) {
    return CAppBar(
      title: widget.serviceName,
      isBack: true,
      centerTitle: true,
      trailing: Row(
        children: [
          AnimationButtonEffect(
            onTap: _toggleSearch,
            child: SvgPicture.asset("assets/icons/search.svg",
                width: 20.w, height: 20.h),
          ),
          12.w.horizontalSpace,
          AnimationButtonEffect(
            onTap: () {},
            child: SvgPicture.asset("assets/icons/valyuta_change.svg",
                width: 20.w, height: 20.h),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar(dynamic colors, dynamic fonts) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: colors.shade0,
        boxShadow: colors.shadowMMMM,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "count_services_selected".tr(namedArgs: {"count": "$chose"}),
                style: fonts.xSmallLink
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              AnimationButtonEffect(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => _SelectedServicesModal(
                      selectedServices: selectedServices,
                      onRemoveService: (service) {
                        _handleServiceSelection(service);
                      },
                    ),
                  );
                },
                child: SvgPicture.asset(
                  "assets/icons/right.svg",
                  width: 20.w,
                  height: 20.h,
                  color: colors.iconGreyColor,
                ),
              ),
            ],
          ),
          12.h.verticalSpace,
          CButton(
            onTap: () {
              if (chose >= 1) {}
            },
            title: 'next'.tr(),
          ),
        ],
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: colors.neutral200)),
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
                      service['name'] ?? '',
                      style: fonts.smallSemLink.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        service['description'] ?? 'Test description',
                        style: fonts.smallLink.copyWith(
                          color: colors.neutral600,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      service['priceUzs'].toString(),
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

class _SelectedServicesModal extends StatelessWidget {
  final List<Map<String, dynamic>> selectedServices;
  final Function(Map<String, dynamic>) onRemoveService;

  const _SelectedServicesModal({
    required this.selectedServices,
    required this.onRemoveService,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: colors.neutral400,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Выбраны ${selectedServices.length} услуги",
              style: fonts.smallSemLink.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.h),
            ...selectedServices.map((service) => Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service['name'],
                                style: fonts.smallSemLink.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                service['description'],
                                style: fonts.smallLink.copyWith(
                                  fontSize: 12.sp,
                                  color: colors.neutral600,
                                ),
                              ),
                              Text(
                                "${service['priceUzs']} UZS",
                                style: fonts.smallSemLink.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                            "assets/images/trash.png",
                            width: 28.w,
                            height: 28.h,
                          ),
                          onPressed: () => onRemoveService(service),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                  ],
                )),
            SizedBox(height: 16.h),
            CButton(
              onTap: () => Navigator.pop(context),
              title: 'Готово',
            ),
          ],
        ),
      );
    });
  }
}
