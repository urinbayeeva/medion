import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medion/application/content/content_bloc.dart';
import 'package:medion/presentation/component/c_appbar.dart';
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
          body: Column(
            children: [
              CAppBar(
                title: "team".tr(),
                centerTitle: true,
                isBack: true,
                trailing: 24.w.horizontalSpace,
              ),
              BlocBuilder<ContentBloc, ContentState>(
                builder: (context, state) {
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
