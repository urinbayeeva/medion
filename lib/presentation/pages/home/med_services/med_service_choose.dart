import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/c_expension_listtile.dart';
import 'package:medion/presentation/pages/home/med_services/med_service_doctor_chose.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:http/http.dart' as http;
import 'package:medion/utils/constants.dart';
import 'dart:convert';

import 'package:medion/utils/helpers/decode_html.dart';

class MedServiceChoose extends StatefulWidget {
  final int serviceTypeId;
  final bool isDoctorService;
  final int? doctorId;

  const MedServiceChoose({
    super.key,
    required this.serviceTypeId,
    this.isDoctorService = false,
    this.doctorId,
  });

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
  double turns = 0.0;
  bool changeSum = false;
  DBService? dbService;
  String _currentFilter = 'all';

  List<dynamic> get _filteredCategories {
    if (_currentFilter == 'all') return _categories;

    final filtered = _categories
        .map((category) {
          final filteredServices =
              (category['services'] as List).where((service) {
            if (_currentFilter == 'adult') return service['is_child'] == false;
            if (_currentFilter == 'child') return service['is_child'] == true;
            return true;
          }).toList();

          return {
            'category_name': category['category_name'],
            'services': filteredServices,
          };
        })
        .where((category) => (category['services'] as List).isNotEmpty)
        .toList();

    return filtered;
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      backgroundColor: Style.shade0,
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return FilterDialog(
          onFilterApplied: (filter) {
            setState(() {
              _currentFilter = filter;
            });
          },
          currentFilter: _currentFilter,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeDBService();
    _fetchServices();
  }

  Future<void> _initializeDBService() async {
    dbService = await DBService.create;
    setState(() {
      changeSum = dbService?.getCurrencyPreference ?? false;
    });
  }

  Future<void> _fetchServices() async {
    try {
      final Uri uri;

      if (widget.isDoctorService) {
        if (widget.doctorId == null) {
          throw Exception('Doctor ID is required for doctor services');
        }
        uri = Uri.parse(
          '${Constants.baseUrlP}/booking/services_by_doctor/${widget.doctorId}',
        );
      } else {
        uri = Uri.parse(
          '${Constants.baseUrlP}/booking/category_services/${widget.serviceTypeId}',
        );
      }

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        setState(() {
          _categories = json.decode(responseBody);
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'no_result_found'.tr();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'no_result_found'.tr();
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

  String formatNumber(dynamic number, {bool isDecimal = false}) {
    if (number == null) return isDecimal ? "0.00" : "0";

    // Convert to double first to handle both int and string inputs
    double doubleValue;
    if (number is String) {
      doubleValue = double.tryParse(number) ?? 0;
    } else if (number is int) {
      doubleValue = number.toDouble();
    } else {
      doubleValue = number;
    }

    if (isDecimal) {
      // Format with 2 decimal places
      String formatted = doubleValue.toStringAsFixed(2);
      List<String> parts = formatted.split('.');
      String integerPart = parts[0];
      String decimalPart = parts.length > 1 ? parts[1] : "00";

      // Add thousand separators
      final buffer = StringBuffer();
      for (int i = 0; i < integerPart.length; i++) {
        if (i > 0 && (integerPart.length - i) % 3 == 0) {
          buffer.write(' ');
        }
        buffer.write(integerPart[i]);
      }
      buffer.write('.');
      buffer.write(decimalPart);
      return buffer.toString();
    } else {
      // Format without decimal places
      int intValue = doubleValue.toInt();
      String numberStr = intValue.toString();
      final buffer = StringBuffer();
      for (int i = 0; i < numberStr.length; i++) {
        if (i > 0 && (numberStr.length - i) % 3 == 0) {
          buffer.write(' ');
        }
        buffer.write(numberStr[i]);
      }
      return buffer.toString();
    }
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
                trailing: Row(
                  children: [
                    AnimatedRotation(
                        turns: turns,
                        duration: const Duration(seconds: 1),
                        child: AnimationButtonEffect(
                            onTap: () {
                              setState(() {
                                turns += 2 / 4;
                                changeSum = !changeSum;
                                dbService?.setCurrencyPreference(changeSum);
                              });
                            },
                            child: icons.valyutaChange
                                .svg(width: 20.w, height: 20.h))),
                    6.w.horizontalSpace,
                    AnimationButtonEffect(
                        onTap: _showFilterDialog,
                        child: icons.filter.svg(width: 20.w, height: 20.h)),
                  ],
                )),
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
      return Center(
          child: CircularProgressIndicator(
        color: colors.error500,
      ));
    }

    if (_error != null) {
      return Center(child: Text(_error!));
    }

    if (_filteredCategories.isEmpty) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/emoji-sad_d.svg",
            width: 74.w,
            height: 78.h,
          ),
          Text(
            'no_result_found'.tr(),
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ));
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: _filteredCategories.length,
            itemBuilder: (context, index) {
              final category = _filteredCategories[index];
              return _ServiceCategoryTile(
                categoryName: category['category_name'] ?? 'Unnamed Category',
                services:
                    List<Map<String, dynamic>>.from(category['services'] ?? []),
                colors: colors,
                fonts: fonts,
                icons: icons,
                onServiceSelected: _handleServiceSelection,
                selectedServiceIds: selectedServiceIDCatch,
                changeSum: changeSum,
              );
            },
          ),
        ),
        if (chose >= 1) ...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            width: double.infinity,
            color: chose >= 1 ? null : colors.shade0,
            decoration: chose >= 1
                ? BoxDecoration(
                    boxShadow: colors.shadowMMMM,
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
                                changeSum: changeSum,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedServiceDoctorChose(
                                    servicesID: selectedServices
                                        .map((s) => s['id'] as int)
                                        .toList(),
                                  )));
                    }
                  },
                  title: 'next'.tr(),
                )
              ],
            ),
          ),
        ]
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
  final bool changeSum;

  const _ServiceCategoryTile({
    required this.categoryName,
    required this.services,
    required this.colors,
    required this.fonts,
    required this.icons,
    required this.onServiceSelected,
    required this.selectedServiceIds,
    required this.changeSum,
  });

  @override
  State<_ServiceCategoryTile> createState() => _ServiceCategoryTileState();
}

class _ServiceCategoryTileState extends State<_ServiceCategoryTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.services.isEmpty) return const SizedBox.shrink();

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
          changeSum: widget.changeSum,
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
  final bool changeSum;

  const _ServiceItem({
    required this.service,
    required this.colors,
    required this.fonts,
    required this.icons,
    required this.isSelected,
    required this.onTap,
    required this.changeSum,
  });

  String formatNumber(dynamic number, {bool isDecimal = false}) {
    if (number == null) return isDecimal ? "0.00" : "0";

    double doubleValue;
    if (number is String) {
      doubleValue = double.tryParse(number) ?? 0;
    } else if (number is int) {
      doubleValue = number.toDouble();
    } else {
      doubleValue = number;
    }

    if (isDecimal) {
      String formatted = doubleValue.toStringAsFixed(2);
      List<String> parts = formatted.split('.');
      String integerPart = parts[0];
      String decimalPart = parts.length > 1 ? parts[1] : "00";

      final buffer = StringBuffer();
      for (int i = 0; i < integerPart.length; i++) {
        if (i > 0 && (integerPart.length - i) % 3 == 0) {
          buffer.write(' ');
        }
        buffer.write(integerPart[i]);
      }
      buffer.write('.');
      buffer.write(decimalPart);
      return buffer.toString();
    } else {
      int intValue = doubleValue.toInt();
      String numberStr = intValue.toString();
      final buffer = StringBuffer();
      for (int i = 0; i < numberStr.length; i++) {
        if (i > 0 && (numberStr.length - i) % 3 == 0) {
          buffer.write(' ');
        }
        buffer.write(numberStr[i]);
      }
      return buffer.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Color(0xFFF2F2F3)),
          bottom: BorderSide(width: 1, color: Color(0xFFF2F2F3)),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
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
                        decodeHtml(
                          service['description'] is String
                              ? service['description']
                              : 'Test description',
                        ),
                        style: fonts.smallLink.copyWith(
                          color: colors.neutral600,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      changeSum
                          ? "${formatNumber(service['doctor_price_start_uzs'])} UZS"
                          : "${formatNumber(service['doctor_price_start_usd'], isDecimal: true)} USD",
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
                margin: EdgeInsets.only(bottom: 20.h),
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

class ServiceSelectionModal extends StatefulWidget {
  final List<Map<String, dynamic>> selectedServices;
  final int chose;
  final Function(Map<String, dynamic>) onRemoveService;
  final bool changeSum;

  const ServiceSelectionModal({
    super.key,
    required this.selectedServices,
    required this.chose,
    required this.onRemoveService,
    required this.changeSum,
  });

  @override
  State<ServiceSelectionModal> createState() => _ServiceSelectionModalState();
}

class _ServiceSelectionModalState extends State<ServiceSelectionModal> {
  late List<Map<String, dynamic>> _currentServices;
  late int _currentChose;

  String formatNumber(dynamic number, {bool isDecimal = false}) {
    if (number == null) return isDecimal ? "0.00" : "0";

    double doubleValue;
    if (number is String) {
      doubleValue = double.tryParse(number) ?? 0;
    } else if (number is int) {
      doubleValue = number.toDouble();
    } else {
      doubleValue = number;
    }

    if (isDecimal) {
      String formatted = doubleValue.toStringAsFixed(2);
      List<String> parts = formatted.split('.');
      String integerPart = parts[0];
      String decimalPart = parts.length > 1 ? parts[1] : "00";

      final buffer = StringBuffer();
      for (int i = 0; i < integerPart.length; i++) {
        if (i > 0 && (integerPart.length - i) % 3 == 0) {
          buffer.write(' ');
        }
        buffer.write(integerPart[i]);
      }
      buffer.write('.');
      buffer.write(decimalPart);
      return buffer.toString();
    } else {
      int intValue = doubleValue.toInt();
      String numberStr = intValue.toString();
      final buffer = StringBuffer();
      for (int i = 0; i < numberStr.length; i++) {
        if (i > 0 && (numberStr.length - i) % 3 == 0) {
          buffer.write(' ');
        }
        buffer.write(numberStr[i]);
      }
      return buffer.toString();
    }
  }

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

    if (_currentServices.isEmpty) {
      Navigator.of(context).pop();
    }
  }

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
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Выбраны ${_currentChose} услуги",
                  style: fonts.smallSemLink
                      .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            ..._currentServices.map((service) => Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${service['name']}",
                                    style: fonts.smallSemLink.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    decodeHtml(
                                      service['description'] is String
                                          ? service['description']
                                          : 'Test description',
                                    ),
                                    style: fonts.smallLink.copyWith(
                                      color: colors.neutral600,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    widget.changeSum
                                        ? "${formatNumber(service['doctor_price_start_uzs'])} UZS"
                                        : "${formatNumber(service['doctor_price_start_usd'], isDecimal: true)} USD",
                                    style: fonts.smallSemLink.copyWith(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                            "assets/images/trash.png",
                            width: 28.w,
                            height: 28.h,
                          ),
                          onPressed: () => _removeService(service),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                  ],
                )),
            SizedBox(height: 16.h),
            CButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              title: 'Готово',
            ),
          ],
        ),
      );
    });
  }
}

class FilterDialog extends StatefulWidget {
  final Function(String) onFilterApplied;
  final String currentFilter;

  const FilterDialog({
    super.key,
    required this.onFilterApplied,
    required this.currentFilter,
  });

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late String _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.currentFilter;
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Container(

          // ignore: sort_child_properties_last
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                "filter".tr(),
                style: fonts.smallSemLink.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              _buildFilterOption("Все", "all"),
              CDivider(),
              SizedBox(height: 16.h),
              _buildFilterOption("Взрослые", "adult"),
              CDivider(),
              SizedBox(height: 16.h),
              _buildFilterOption("Дети", "child"),
              CDivider(),
              SizedBox(height: 24.h),
              CButton(
                onTap: () {
                  widget.onFilterApplied(_selectedFilter);
                  Navigator.of(context).pop();
                },
                title: 'Применить',
              ),
            ],
          ),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ));
    });
  }

  Widget _buildFilterOption(String title, String value) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return InkWell(
        onTap: () {
          setState(() {
            _selectedFilter = value;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: fonts.smallSemLink.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: colors.neutral900,
              ),
            ),
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedFilter == value
                      ? colors.primary500
                      : colors.neutral400,
                  width: 2.w,
                ),
              ),
              child: Center(
                child: _selectedFilter == value
                    ? Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors.primary500,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      );
    });
  }
}
