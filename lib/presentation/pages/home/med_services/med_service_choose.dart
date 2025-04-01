import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedServiceChoose extends StatefulWidget {
  final int serviceTypeId;

  const MedServiceChoose({super.key, required this.serviceTypeId});

  @override
  State<MedServiceChoose> createState() => _MedServiceChooseState();
}

class _MedServiceChooseState extends State<MedServiceChoose> {
  List<dynamic> _categories = [];
  bool _isLoading = true;
  String? _error;
  int chose = 0;
  List<Map<String, dynamic>> selectedServices = [];
  Set<int> selectedServiceIDCatch = {};

  @override
  void initState() {
    super.initState();
    _fetchServices();
  }

  Future<void> _fetchServices() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://his.uicgroup.tech/apiweb/booking/category_services/${widget.serviceTypeId}'),
      );

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        setState(() {
          _categories = json.decode(responseBody);
          _isLoading = false;
        });
      } else {
        setState(() {
          _error =
              'Failed to load services. Status code: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to load services: ${e.toString()}';
        _isLoading = false;
      });
    }
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
            CAppBar(
              title: "selecting_service".tr(),
              centerTitle: true,
              isBack: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: _buildContent(colors, fonts, icons),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildContent(colors, fonts, icons) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text(_error!));
    }

    if (_categories.isEmpty) {
      return Center(child: Text('no_services_available'.tr()));
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return _ServiceCategoryTile(
                categoryName: category['category_name'] ?? 'Unnamed Category',
                services:
                    List<Map<String, dynamic>>.from(category['services'] ?? []),
                colors: colors,
                fonts: fonts,
                icons: icons,
                onServiceSelected: _handleServiceSelection,
                selectedServiceIds: selectedServiceIDCatch,
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          width: double.infinity,
          color: chose >= 1 ? null : colors.shade0,
          decoration: chose >= 1
              ? BoxDecoration(
                  color: colors.shade0,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
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
                      "count_services_selected"
                          .tr(namedArgs: {"count": "$chose"}),
                      style: fonts.xSmallLink.copyWith(
                          fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                    AnimationButtonEffect(
                      disabled: chose == 0 ? true : false,
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: colors.shade0,
                          context: context,
                          isDismissible: true,
                          isScrollControlled: true,
                          enableDrag: true,
                          builder: (context) {
                            return DraggableScrollableSheet(
                              expand: false,
                              builder: (BuildContext context,
                                  ScrollController scrollController) {
                                return ServiceSelectionModal(
                                  selectedServices: selectedServices,
                                  chose: chose,
                                  onRemoveService: (serviceToRemove) {
                                    setState(() {
                                      selectedServices.remove(serviceToRemove);
                                      selectedServiceIDCatch
                                          .remove(serviceToRemove['id']);
                                      chose--;
                                    });
                                  },
                                );
                              },
                            );
                          },
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
              ],
              CButton(
                onTap: () {
                  if (chose >= 1) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AppointmentPage(
                    //       index: 2,
                    //       selectedServiceIds: selectedServiceIDCatch.toSet(),
                    //     ),
                    //   ),
                    // );
                  }
                },
                title: 'next'.tr(),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _ServiceCategoryTile extends StatefulWidget {
  final String categoryName;
  final List<Map<String, dynamic>> services;
  final dynamic colors;
  final dynamic fonts;
  final dynamic icons;
  final Function(Map<String, dynamic>) onServiceSelected;
  final Set<int> selectedServiceIds;

  const _ServiceCategoryTile({
    required this.categoryName,
    required this.services,
    required this.colors,
    required this.fonts,
    required this.icons,
    required this.onServiceSelected,
    required this.selectedServiceIds,
  });

  @override
  State<_ServiceCategoryTile> createState() => _ServiceCategoryTileState();
}

class _ServiceCategoryTileState extends State<_ServiceCategoryTile> {
  @override
  Widget build(BuildContext context) {
    return CustomExpansionListTile(
      description: widget.services.isEmpty
          ? 'no_services_available'.tr()
          : 'services_list'.tr(),
      title: widget.categoryName,
      children: widget.services.map((service) {
        return _ServiceItem(
          service: service,
          colors: widget.colors,
          fonts: widget.fonts,
          icons: widget.icons,
          isSelected: widget.selectedServiceIds.contains(service['id']),
          onTap: () => widget.onServiceSelected(service),
        );
      }).toList(),
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final Map<String, dynamic> service;
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
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Row(
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
                  if (service['description'] != null)
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        service['description'] ?? '',
                        style: fonts.smallLink.copyWith(
                          color: colors.neutral600,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  Text(
                    "${service['doctor_price_start_uzs'] ?? 0} UZS",
                    style: fonts.smallLink.copyWith(
                      color: colors.primary900,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
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
                isSelected ? "assets/icons/check.svg" : "assets/icons/plus.svg",
                color: isSelected ? Colors.white : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceSelectionModal extends StatefulWidget {
  final List<Map<String, dynamic>> selectedServices;
  final int chose;
  final Function(Map<String, dynamic>) onRemoveService;

  const ServiceSelectionModal({
    required this.selectedServices,
    required this.chose,
    required this.onRemoveService,
  });

  @override
  State<ServiceSelectionModal> createState() => _ServiceSelectionModalState();
}

class _ServiceSelectionModalState extends State<ServiceSelectionModal> {
  late List<Map<String, dynamic>> _currentServices;
  late int _currentChose;

  @override
  void initState() {
    super.initState();
    _currentServices = List.from(widget.selectedServices);
    _currentChose = widget.chose;
  }

  void _removeService(Map<String, dynamic> service) {
    setState(() {
      _currentServices.remove(service);
      _currentChose--;
    });
    widget.onRemoveService(service);

    // Close bottom sheet if no services left
    if (_currentServices.isEmpty) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "selected_services".tr(namedArgs: {"count": "$_currentChose"}),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          ..._currentServices.map((service) => ListTile(
                title: Text(service['name'] ?? ''),
                subtitle: Text("${service['doctor_price_start_uzs'] ?? 0} UZS"),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _removeService(service),
                ),
              )),
        ],
      ),
    );
  }
}
