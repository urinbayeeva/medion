// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import 'package:medion/presentation/styles/style.dart';
// import 'package:medion/presentation/styles/theme_wrapper.dart';
//
// class OnboardingContent extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String description;
//
//   const OnboardingContent({
//     required this.imagePath,
//     required this.title,
//     required this.description,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ThemeWrapper(
//       builder: (context, colors, fonts, icons, controller) {
//         return Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Spacer(),
//               SvgPicture.asset(imagePath),
//               40.h.verticalSpace,
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: Style.headlineText(
//                   size: 22.sp,
//                   color: colors.primary900,
//                 ),
//               ),
//               8.h.verticalSpace,
//               Text(
//                 description,
//                 textAlign: TextAlign.center,
//                 style: Style.smallLink(
//                   size: 15.sp,
//                   color: colors.neutral300,
//                 ),
//               ),
//               16.h.verticalSpace,
//               const Spacer(),
//             ],
//           ),
//         );
//       }
//     );
//   }
// }
