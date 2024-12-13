import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/domain/sources/directions_data.dart';
import 'package:medion/presentation/pages/home/inner_pages/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class DirectionsPage extends StatefulWidget {
  const DirectionsPage({super.key});

  @override
  State<DirectionsPage> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                bordered: true,
                hasSearch: true,
                title: "Направления",
                centerTitle: true,
                isBack: true,
                trailing: icons.filter.svg(width: 24.w, height: 24.h),
              ),
              Expanded(
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: directionsData.length,
                      itemBuilder: (context, index) {
                        final item = directionsData[index];
                        return MedicalDirectionItem(
                          onTap: () {
                            _onItemTapped(index);

                            Navigator.push(
                              context,
                              AppRoutes.getDirectionInfoPage(
                                appBarTitle: item["title"],
                                informationTitle: item["information_title"],
                                doctorsList: item["doctorsList"],
                                professionServiceType:
                                    item["professionServiceType"],
                                price: item["price"],
                              ),
                            );
                            context
                                .read<BottomNavBarController>()
                                .changeNavBar(true);
                          },
                          title: item['title'],
                          subtitle: item['subtitle'],
                          iconPath: item['icon'],
                        );
                      },
                    ),
                    60.h.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
