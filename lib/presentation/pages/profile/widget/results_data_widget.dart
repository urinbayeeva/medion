import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/application/services/open_pdf_service.dart';
import 'package:medion/infrastructure/services/download_service.dart';
import 'package:medion/presentation/component/animation_effect.dart';
import 'package:medion/presentation/component/c_small_container.dart';
import 'package:medion/presentation/pages/appointment/payment_web_view.dart';
import 'package:medion/presentation/pages/profile/widget/results_data.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:medion/utils/open_pdf_files.dart';
import 'package:path/path.dart' as path;
import 'package:url_launcher/url_launcher.dart';

class ResultsDataWidget extends StatefulWidget {
  const ResultsDataWidget({super.key});

  @override
  State<ResultsDataWidget> createState() => _ResultsDataWidgetState();
}

class _ResultsDataWidgetState extends State<ResultsDataWidget> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthEvent.fetchPatientAnalyze());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return resultsData.isEmpty || state.patientAnalyze.isEmpty
            ? Center(
                child: Text(
                  'Нет данных для отображения',
                  style: fonts.smallText.copyWith(color: colors.neutral600),
                ),
              )
            : ListView.builder(
                itemCount: resultsData.length,
                padding: EdgeInsets.all(16.w),
                itemBuilder: (context, item) {
                  final data = resultsData[item];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: colors.shade0,
                    ),
                    child: AnimationButtonEffect(
                      onTap: () async {
                        context
                            .read<BottomNavBarController>()
                            .changeNavBar(true);

                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentWebView(
                                        url:
                                            "https://his.uicgroup.tech/web/content/15171")))
                            .then((_) {
                          context
                              .read<BottomNavBarController>()
                              .changeNavBar(false);
                        });
                      },
                      child: ListTile(
                        title: Text(state.patientAnalyze[item]!.documentName,
                            style: fonts.smallSemLink),
                        subtitle: Text(state.patientAnalyze[item]!.date,
                            style: fonts.xSmallText
                                .copyWith(color: colors.neutral600)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CSmallContainer(
                              icon: icons.download,
                              onTap: () async {
                                final fileDownloadService =
                                    FileDownloadService();
                                await fileDownloadService
                                    .downloadPDFWithProgress(
                                  context,
                                  data['link'],
                                  "sample.pdf",
                                  colors.error500,
                                  colors.shade0,
                                );
                              },
                              color: colors.neutral200,
                            ),
                            8.w.horizontalSpace,
                            CSmallContainer(
                              icon: icons.link,
                              onTap: () {},
                              color: colors.neutral200,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      });
    });
  }
}
