import 'dart:developer';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/branches/branch_bloc.dart';
import 'package:medion/presentation/component/c_divider.dart';
import 'package:medion/presentation/component/custom_tabbar.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/others/our_activity/component/history_page.dart';
import 'package:medion/presentation/pages/others/our_activity/component/mission.dart';
import 'package:medion/presentation/pages/others/our_activity/component/our_company.dart';
import 'package:medion/presentation/pages/others/our_activity/component/pattern_background.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class OurActivityPage extends StatefulWidget {
  const OurActivityPage({super.key});

  @override
  State<OurActivityPage> createState() => _OurActivityPageState();
}

class _OurActivityPageState extends State<OurActivityPage> {
  late final BranchBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<BranchBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(const BranchEvent.fetchActivity());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: colors.shade0,
              foregroundColor: colors.darkMode900,
              scrolledUnderElevation: 0,
              leading: WScaleAnimation(
                child: Icon(Icons.keyboard_arrow_left, size: 32.h),
                onTap: () => Navigator.of(context).pop(),
              ),
              title: Text("our_activities".tr(), style: fonts.regularMain),
            ),
            backgroundColor: colors.backgroundColor,
            body: BlocBuilder<BranchBloc, BranchState>(
              buildWhen: (o, n) => o.medionActivity != n.medionActivity,
              builder: (context, state) {
                if (state.activityStatus.isInProgress || state.activityStatus.isInitial) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (state.activityStatus.isFailure) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icons.emojiSad.svg(width: 72.w, height: 72.h),
                        Text(
                          "no_result_found".tr(),
                          style: fonts.headlineSecondary,
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PatternBackground(patternTitle: state.medionActivity?.description ?? ''),
                    const CDivider(padding: false),
                    CustomTabbarBlack(
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      isScrollable: false,
                      tabs: ["about_the_company".tr(), "history".tr(), "mission".tr()],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          OurCompany(fonts: fonts, title: state.medionActivity?.about ?? ""),
                          History(fonts: fonts, title: state.medionActivity?.history ?? ""),
                          Mission(fonts: fonts, title: state.medionActivity?.mission ?? ""),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

const String exampleData = '''
<div class="ck-content">
  <p><span>Сеть клиник Medion – это три больших многопрофильных медицинских центра, каждый из которых отличается своей особенностью.</span></p>

  <p><span>Все клиники оснащены современным оборудованием от таких зарубежных производителей, как GE HealthCare, Alma, Dornier, Olympus и другие.</span></p>

  <p>
    <img src="https://media.istockphoto.com/id/1778918997/photo/background-of-a-large-group-of-assorted-capsules-pills-and-blisters.jpg?s=612x612&w=0&k=20&c=G6aeWKN1kHyaTxiNdToVW8_xGY0hcenWYIjjG_xwF_Q=" alt="Medion clinic image" style="max-width: 100%;" />
  </p>

  <p>
    <video controls style="max-width: 100%;">
      <source src="https://samplelib.com/lib/preview/mp4/sample-5s.mp4" type="video/mp4">
      Sizning brauzeringiz video formatini qo‘llab-quvvatlamaydi.
    </video>
  </p>

  <ul>
    <li>Современная диагностика с использованием передовых технологий</li>
    <li>Квалифицированные специалисты с международным опытом</li>
    <li>Комфортные условия для пациентов</li>
  </ul>

  <ul>
    <li><img src="https://www.hopkinsmedicine.org/-/media/patient-care/images/patient-rooms-1.jpg" alt="Hospital ward" style="max-width: 100%;" /></li>
     <li><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS68NVRCvU9cXYQ1HWtONIDQPmLjOGjzxsxd8V3lzE1h18y-PGy_5utL8mqXjOl9sk1bsA&usqp=CAU" alt="Medical equipment" style="max-width: 100%;" /></li>
    <li><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-c4SGcdob2v7OVyC6EgWxEaOxFWKZBOURwdqoyBVyMAL-ztqaC69_fyL8J7DES6VZlFY&usqp=CAU" alt="Doctor consultation" style="max-width: 100%;" /></li>
  </ul>

  <ul>
    <li>
      <video controls style="max-width: 100%;">
        <source src="https://samplelib.com/lib/preview/mp4/sample-5s.mp4" type="video/mp4">
        Sizning brauzeringiz video formatini qo‘llab-quvvatlamaydi.
      </video>
    </li>
    <li>
      <video controls style="max-width: 100%;">
        <source src="https://samplelib.com/lib/preview/mp4/sample-5s.mp4" type="video/mp4">
        Sizning brauzeringiz video formatini qo‘llab-quvvatlamaydi.
      </video>
    </li>
    <li>
      <video controls style="max-width: 100%;">
        <source src="https://samplelib.com/lib/preview/mp4/sample-5s.mp4" type="video/mp4">
        Sizning brauzeringiz video formatini qo‘llab-quvvatlamaydi.
      </video>
    </li>
  </ul>
</div>
''';
