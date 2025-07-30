import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:medion/application/vacancy_bloc/vacancy_bloc.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/component/w_html/w_html.dart';
import 'package:medion/presentation/pages/others/career/career_single.dart';
import 'package:medion/presentation/styles/theme.dart';

class VacanciesCards extends StatelessWidget {
  const VacanciesCards({
    super.key,
    required this.index,
    required this.fonts,
    required this.icons,
    required this.colors,
    required this.state,
    required this.bloc,
  });

  final int index;
  final FontSet fonts;
  final IconSet icons;
  final CustomColorSet colors;
  final VacancyState state;
  final VacancyBloc bloc;

  @override
  Widget build(BuildContext context) {
    final officeV = state.vacancies?.officeVacancies.toList() ?? <VacancyDetailModel>[];
    final medV = state.vacancies?.medicineVacancies.toList() ?? <VacancyDetailModel>[];

    List<VacancyDetailModel> vacancies = index == 0 ? medV : officeV;

    if (state.vacancyStatus.isInProgress || state.vacancyStatus.isInitial) {
      return const Center(child: CupertinoActivityIndicator());
    }
    if (state.vacancyStatus.isFailure || vacancies.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vacancies.length,
      itemBuilder: (context, index) {
        final vacancy = vacancies[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h).copyWith(top: 0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: colors.shade0),
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(vacancy.name, style: fonts.smallMain),
              WHtml(data: vacancy.description),
              SizedBox(height: 10.h),
              CButton(
                title: "get_know".tr(),
                textColor: colors.darkMode900,
                backgroundColor: colors.neutral200,
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) {
                    return VacancySingle(vacancy: vacancy, bloc: bloc);
                  }));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
