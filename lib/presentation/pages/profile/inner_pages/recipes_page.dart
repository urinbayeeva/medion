import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:medion/application/auth/auth_bloc.dart';
import 'package:medion/domain/models/payment_model.dart';
import 'package:medion/presentation/pages/others/component/w_scala_animation.dart';
import 'package:medion/presentation/pages/visits/widgets/empty_state.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const AuthEvent.fetchRecipes());
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
            title: Text("recipe".tr(), style: fonts.regularMain),
          ),
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.fetchRecipeStatus.isInProgress || state.fetchRecipeStatus.isInitial) {
                return const Center(child: CupertinoActivityIndicator());
              }

              if (state.fetchRecipeStatus.isFailure) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_results_found".tr()),
                  ),
                );
              }

              final filteredRecipes = state.recipes.where((recipe) {
                final hasPrescriptions = recipe.prescriptions != null && recipe.prescriptions!.isNotEmpty;
                final hasVisitPrescriptions = hasPrescriptions &&
                    recipe.prescriptions!.any((p) => p.visitPrescriptions != null && p.visitPrescriptions!.isNotEmpty);
                return hasVisitPrescriptions;
              }).toList();

              if (filteredRecipes.isEmpty && state.fetchRecipeStatus.isSuccess) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 130.h),
                    child: EmptyState(title: "no_results_found".tr()),
                  ),
                );
                // return Center(
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       icons.newEmpty.svg(),
                //       Text('recommendations_empty'.tr(), style: fonts.regularMain),
                //       20.verticalSpace,
                //     ],
                //   ),
                // );
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: filteredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = filteredRecipes[index];

                  return Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 2),
                    child: RecipeCard(
                      colors: colors,
                      fonts: fonts,
                      icons: icons,
                      recipe: recipe,
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

class RecipeCard extends StatefulWidget {
  const RecipeCard({
    super.key,
    required this.colors,
    required this.fonts,
    required this.icons,
    required this.recipe,
  });

  final CustomColorSet colors;
  final FontSet fonts;
  final IconSet icons;
  final RecipeModel recipe;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  ValueNotifier<bool> isOpen = ValueNotifier(false);

  String formatDate(String date, BuildContext context) {
    if (date.isEmpty || date.length < 6) return date;
    try {
      final inputFormat = DateFormat("dd.MM.yyyy HH:mm");
      final parsed = inputFormat.parse(date);

      final locale = context.locale.languageCode;

      final outputFormat = DateFormat("EEEE, d MMMM, HH:mm", locale);
      final formatted = outputFormat.format(parsed);

      return capitalize(formatted);
    } catch (e) {
      return date;
    }
  }

  String capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isOpen,
      builder: (context, value, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 400),
              child: GestureDetector(
                onTap: () => isOpen.value = !isOpen.value,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(16, 10, 16, (isOpen.value) ? 0 : 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: const Radius.circular(12),
                      bottom: isOpen.value ? Radius.zero : const Radius.circular(12),
                    ),
                    color: widget.colors.shade0,
                    border: Border(
                      bottom: BorderSide(color: isOpen.value ? widget.colors.neutral300 : widget.colors.shade0),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            Text(
                              widget.recipe.service ?? '',
                              style: widget.fonts.smallText.copyWith(fontWeight: FontWeight.w600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 4,
                              children: [
                                widget.icons.clock.svg(width: 18, height: 18, color: widget.colors.error500),
                                Text(
                                  formatDate(widget.recipe.datetime ?? "", context),
                                  style: widget.fonts.xSmallText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Text(
                              widget.recipe.patientName ?? '',
                              style: widget.fonts.xSmallText.copyWith(color: const Color(0xff505050)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            6.h.verticalSpace,
                          ],
                        ),
                      ),
                      if (isOpen.value) ...{
                        const Icon(Icons.keyboard_arrow_up, size: 20),
                      } else ...{
                        const Icon(Icons.keyboard_arrow_down, size: 20),
                      }
                    ],
                  ),
                ),
              ),
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 400),
              crossFadeState: value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: const SizedBox.shrink(),
              secondChild: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (widget.recipe.prescriptions == null ||
                      (widget.recipe.prescriptions != null && widget.recipe.prescriptions!.isEmpty)) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/anim/sad.json"),
                      ],
                    );
                  }

                  final visitRecipe = widget.recipe.prescriptions!.first;
                  final recipe = visitRecipe.visitPrescriptions![index];

                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: widget.colors.shade0,
                      borderRadius: BorderRadius.vertical(
                        bottom: (index == widget.recipe.prescriptions!.length - 1)
                            ? const Radius.circular(12)
                            : Radius.zero,
                      ),
                    ),
                    child: Column(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            recipe.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: widget.fonts.smallMain,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        rowData(
                          icon: widget.icons.dragOnHand.svg(),
                          title: recipe.administrationMethods ?? '',
                          fonts: widget.fonts,
                        ),
                        rowData(
                          icon: widget.icons.clockLaunch.svg(),
                          title: recipe.foodRegarding ?? "",
                          fonts: widget.fonts,
                        ),
                        rowData(
                          icon: widget.icons.calendar.svg(height: 14, width: 14),
                          secondIcon:
                              widget.icons.checkCalendar.svg(height: 14, width: 14, color: const Color(0xff808284)),
                          title: "${recipe.startDate}",
                          secondTitle: "${recipe.duration?.toInt()} ${"day".tr()}",
                          fonts: widget.fonts,
                        ),
                        rowData(
                          icon: widget.icons.clock.svg(),
                          title:
                              "Daily times: ${List.generate(recipe.receptionTime?.length ?? 0, (i) => recipe.receptionTime![i].time)}"
                                  .replaceAll(",", ";"),
                          fonts: widget.fonts,
                        ),
                        rowData(
                          icon: widget.icons.comment.svg(height: 14, width: 14),
                          title: "Comment: ${recipe.notes}",
                          fonts: widget.fonts,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: widget.recipe.prescriptions!.first.visitPrescriptions?.length ?? 0,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget rowData({
    required Widget icon,
    Widget? secondIcon,
    required String title,
    String? secondTitle,
    required FontSet fonts,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 6,
      children: [
        icon,
        Text(title, style: fonts.xSmallMain.copyWith(fontSize: 14, color: const Color(0xff808284))),
        if (secondIcon != null) secondIcon,
        if (secondTitle != null) ...{
          Text(secondTitle, style: fonts.xSmallMain.copyWith(fontSize: 14, color: const Color(0xff808284))),
        },
      ],
    );
  }
}
