import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/domain/sources/appoinment_data.dart';
import 'package:medion/presentation/component/custom_list_view/custom_list_view.dart';
import 'package:medion/presentation/component/custom_pagination.dart';
import 'package:medion/presentation/pages/home/directions/widgets/medical_direction_item.dart';
import 'package:medion/presentation/routes/routes.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DisplayAllServicesPage extends StatefulWidget {
  final VoidCallback? onTap;
  const DisplayAllServicesPage({super.key,  this.onTap});

  @override
  State<DisplayAllServicesPage> createState() => _DisplayAllServicesPageState();
}

class _DisplayAllServicesPageState extends State<DisplayAllServicesPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
      return CustomPagination(
        controller: _refreshController,
        onRetry: () {},
        child: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: CustomListView(
              itemBuilder: (_, item) {
                return Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: MedicalDirectionItem(
                    title: item['service'],
                    subtitle: item['info'],
                    iconPath: item['image'],
                    onTap: widget.onTap!
                  ),
                );
              },
              data: appointmentData,
              emptyWidgetModel: ErrorWidgetModel(title: "", subtitle: ""),
              status: FormzSubmissionStatus.success),
        ),
      );
    });
  }
}
