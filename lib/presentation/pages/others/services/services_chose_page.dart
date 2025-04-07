import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/application/booking/booking_bloc.dart';
import 'package:medion/application/service_page_provider.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
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
  bool _isSearching = false;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
    context.read<BookingBloc>().add(
          BookingEvent.fetchCategoryServices(id: widget.id),
        );
    _refreshController.refreshCompleted();
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchQuery = '';
      _searchController.clear();
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

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return ChangeNotifierProvider(
        create: (_) => ServicesPageProvider(),
        child: Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              if (_isSearching)
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      right: 16.w,
                      left: 16.w),
                  child: Row(
                    children: [
                      AnimationButtonEffect(
                        onTap: () {
                          setState(() {
                            _isSearching = !_isSearching;
                          });
                        },
                        child: icons.left.svg(
                          height: 28.r,
                          width: 28.r,
                          color: colors.shade100,
                        ),
                      ),
                      8.w.horizontalSpace,
                      Expanded(
                        child: CupertinoSearchTextField(
                          controller: _searchController,
                          focusNode: _searchFocusNode,
                          placeholder: 'search_services'.tr(),
                          onChanged: _onSearchChanged,
                          onSubmitted: (_) => _stopSearch(),
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: colors.neutral600,
                          ),
                          suffixIcon: Icon(
                            CupertinoIcons.xmark_circle_fill,
                            color: colors.neutral600,
                          ),
                          style: fonts.smallLink
                              .copyWith(color: colors.primary900),
                          decoration: BoxDecoration(
                            color: colors.shade0,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                CAppBar(
                  title: "      ${widget.serviceName}",
                  isBack: true,
                  centerTitle: true,
                  trailing: Row(
                    children: [
                      AnimationButtonEffect(
                        onTap: _startSearch,
                        child: icons.search.svg(width: 20.w, height: 20.h),
                      ),
                      12.w.horizontalSpace,
                      AnimationButtonEffect(
                        onTap: () {},
                        child:
                            icons.valyutaChange.svg(width: 20.w, height: 20.h),
                      ),
                    ],
                  ),
                ),
              BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  if (state.categoryServices.isEmpty) {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final filteredCategories = _filterServices(
                    state.categoryServices,
                    _searchQuery,
                  );

                  return Expanded(
                    child: Consumer<ServicesPageProvider>(
                      builder: (context, provider, _) {
                        return ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
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
                                          isSelected:
                                              provider.isSelected(service),
                                          onTap: () {
                                            provider.toggleService(service);
                                          },
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
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
