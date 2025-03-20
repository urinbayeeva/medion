// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:medion/presentation/styles/theme.dart';
// import 'package:medion/presentation/styles/theme_wrapper.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class NewsView extends StatefulWidget {
//   const NewsView({super.key});

//   @override
//   State<NewsView> createState() => _NewsViewState();
// }

// class _NewsViewState extends State<NewsView> {
//   final RefreshController _refreshController =
//       RefreshController(initialRefresh: false);
//   late ScrollController scrollController;
//   bool isLoading = true;

//   @override
//   void initState() {
//     scrollController = ScrollController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _refreshController.dispose();
//     scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
//       return SafeArea(
//         child: Scaffold(
//           backgroundColor: colors.shade0,
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "No title",
//                 style: fonts.mediumMain.copyWith(
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(height: 4.h),
//               Text(
//                 "No info available",
//                 style: fonts.smallLink.copyWith(
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Image.network(
//                 "image",
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const SizedBox(
//                     height: 120.0,
//                     child: Center(child: Text('Image not available')),
//                   );
//                 },
//               ),
//               SizedBox(height: 20.h),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
