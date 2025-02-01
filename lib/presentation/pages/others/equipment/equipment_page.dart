import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/pages/others/about_health/component/item_about_health.dart';
import 'package:medion/presentation/pages/others/about_health/sources/about_healt_data.dart';
import 'package:medion/presentation/pages/others/equipment/sources/data_equipment.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Column(
          children: [
            CAppBar(
              title: "equipment".tr(),
              isBack: true,
              centerTitle: true,
              bordered: true,
              trailing: 24.w.horizontalSpace,
            ),
            Expanded(
              child: CustomListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                refreshController: _refreshController,
                onRefresh: () {
                  setState(() {});
                  _refreshController.refreshCompleted();
                },
                itemBuilder: (int index, item) {
                  final data = item ;
                  return ItemAboutHealth(
                    onTap: () {
                      Navigator.push(
                          context,
                          AppRoutes.getInfoViewAboutHealth(
                              imagePath: data['image'],
                              title: data["title"],
                              desc: data['decs']));
                    },
                    title: data['title'],
                    desc: "",
                    imagePath: data['image'],
                  );
                },
                data: dataEquipment,
                emptyWidgetModel:
                    ErrorWidgetModel(title: "title", subtitle: 'subtitle'),
                status: FormzSubmissionStatus.success,
              ),
            )
          ],
        ),
      );
    });
  }
}
