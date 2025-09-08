import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hive/hive.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/domain/models/team/team_model.dart';
import 'package:medion/presentation/component/c_appbar.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  void initState() {
    context.read<ContentBloc>().add(const ContentEvent.getTeams(type: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
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
            title: Text("team".tr(), style: fonts.regularMain),
          ),
          body: BlocBuilder<ContentBloc, ContentState>(
            buildWhen: (o, n) {
              final status = o.teamStatus != n.teamStatus;
              return status;
            },
            builder: (context, state) {
              if (state.teamStatus.isInProgress || state.teamStatus.isInitial) {
                return const Center(child: CupertinoActivityIndicator());
              }

              if (state.teamStatus.isFailure || state.team.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_results_found".tr()),
                  ),
                );
              }

              return ListView.builder(
                itemCount: state.jobTypes.length,
                itemBuilder: (context, index) {
                  final title = state.jobTypes[index];
                  final length = state.jobTypes.length - 1;
                  return Padding(
                    padding: index != length ? EdgeInsets.zero : const EdgeInsets.only(bottom: 20),
                    child: TeamType(
                      team: state.team,
                      title: title,
                      colors: colors,
                      fonts: fonts,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class TeamType extends StatelessWidget {
  const TeamType({super.key, required this.team, required this.title, required this.colors, required this.fonts});

  final List<Team> team;
  final String title;
  final CustomColorSet colors;
  final FontSet fonts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 0, 4),
          child: Text(title.toUpperCase(), style: fonts.regularSemLink),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...List.generate(
                team.length,
                (i) {
                  final user = team[i];
                  if (user.type == title) {
                    return TeamCard(colors: colors, fonts: fonts, i: i, user: user);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard({super.key, required this.colors, required this.fonts, required this.i, required this.user});

  final CustomColorSet colors;
  final FontSet fonts;
  final int i;
  final Team user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 156.w,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: colors.shade0,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          spacing: 4.h,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonImage(
              width: double.maxFinite,
              imageUrl: user.image,
              radius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
              child: Text(user.name, style: fonts.xSmallLink),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Text(user.job, style: fonts.xxSmallText),
            ),
          ],
        ),
      ),
    );
  }
}
