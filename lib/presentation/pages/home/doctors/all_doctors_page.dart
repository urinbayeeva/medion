import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/home/doctors/component/doctors_data.dart';
import 'package:medion/presentation/pages/home/doctors/widget/doctors_item.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';

class AllDoctorsPage extends StatefulWidget {
  const AllDoctorsPage({super.key});

  @override
  State<AllDoctorsPage> createState() => _AllDoctorsPageState();
}

class _AllDoctorsPageState extends State<AllDoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "          Врачи",
              isBack: true,
              hasToggle: true,
              centerTitle: true,
              toggleFirstText: "Врачи Медион",
              toggleSecondText: "Зарубежные врачи",
              onTap: () {
                Navigator.pop(context);
                context.read<BottomNavBarController>().changeNavBar(false);
              },
              trailing: Row(
                children: [
                  icons.search.svg(width: 24.w, height: 24.h),
                  20.w.horizontalSpace,
                  icons.filter.svg(width: 24.w, height: 24.h),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: doctorsData.length,
                  itemBuilder: (context, item) {
                    final data = doctorsData[item];
                    return DoctorsItem(
                      isCategoried: true,
                      categoryType: data['category'],
                      imagePath: data['image'],
                      name: data['name'],
                      status: data['status'],
                      candidateScience: data['candidateScience'],
                    );
                  }),
            ))
          ],
        ),
      );
    });
  }
}
