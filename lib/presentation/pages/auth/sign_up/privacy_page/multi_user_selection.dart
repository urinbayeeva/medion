import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/presentation/component/c_button.dart';
import 'package:medion/presentation/pages/others/component/common_image.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';

class MultiUserSelection extends StatefulWidget {
  const MultiUserSelection({super.key, required this.users});

  final List<User> users;

  @override
  State<MultiUserSelection> createState() => _MultiUserSelectionState();
}

class _MultiUserSelectionState extends State<MultiUserSelection> {
  late final ValueNotifier<User> _selected;

  @override
  void initState() {
    _selected = ValueNotifier(widget.users.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: Text("select_profile".tr(), style: fonts.regularMain),
                      ),
                      const Divider(),
                      ...List.generate(
                        widget.users.length,
                        (i) {
                          final user = widget.users[i];
                          return GestureDetector(
                            onTap: () => _selected.value = user,
                            child: ValueListenableBuilder(
                              valueListenable: _selected,
                              builder: (context, val, child) {
                                final active = _selected.value == widget.users[i];
                                return Container(
                                  height: 78,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: (active) ? colors.error500 : colors.neutral300),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        spacing: 6,
                                        children: [
                                          Container(
                                            height: 57,
                                            width: 57,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: active ? colors.error500 : colors.neutral300),
                                            ),
                                            padding: const EdgeInsets.all(4.0),
                                            child: CommonImage(
                                              imageUrl: user.image ?? '',
                                              errorImageAsset: "assets/images/user_pls.png",
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                child: Text(
                                                  user.name,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: fonts.smallMain.copyWith(fontWeight: FontWeight.w700),
                                                ),
                                              ),
                                              Text(user.date ?? " ", style: fonts.xSmallMain),
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (active) ...{
                                        Icon(Icons.radio_button_checked, color: colors.error500)
                                      } else ...{
                                        Icon(
                                          Icons.radio_button_off,
                                          color: colors.neutral300,
                                        )
                                      }
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0).copyWith(bottom: 10),
                    child: CButton(
                      title: "select_profile".tr(),
                      onTap: () => Navigator.of(context).pop(_selected.value),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
