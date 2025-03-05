import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:medion/presentation/styles/theme_wrapper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

class OpenPDF extends StatefulWidget {
  final File file;
  final String url;
  final provider;

  const OpenPDF(
      {super.key, required this.file, required this.url, this.provider});

  @override
  State<OpenPDF> createState() => _OpenPDFState();
}

class _OpenPDFState extends State<OpenPDF> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool downloading = false;
  var progress = "";
  var path = "No Data";
  var platformVersion = "Unknown";
  var _onPressed;
  Directory? externalDir;

  @override
  void initState() {
    super.initState();
  }

  String convertCurrentDateTimeToString() {
    String formattedDateTime =
        DateFormat('yyyyMMdd_kkmmss').format(DateTime.now()).toString();
    return formattedDateTime;
  }

  Future<void> downloadFile(BuildContext context) async {
    Dio dio = Dio();

    final status = await Permission.storage.request();
    if (status.isGranted) {
      String dirloc = "";
      if (Platform.isAndroid) {
        dirloc = "/sdcard/download/NHB/";
      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }

      try {
        FileUtils.mkdir([dirloc]);
        await dio.download(
            widget.url, "$dirloc${convertCurrentDateTimeToString()}.pdf",
            onReceiveProgress: (receivedBytes, totalBytes) {
          setState(() {
            downloading = true;
            progress =
                "${((receivedBytes / totalBytes) * 100).toStringAsFixed(0)}%";
          });
        });
      } catch (e) {
        print('Download error: $e');
      }

      setState(() {
        downloading = false;
        progress = "Download Completed.";
        path = "$dirloc${convertCurrentDateTimeToString()}.pdf";
      });

      final snackBar = SnackBar(
        content: Text("Download success at $path"),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: "Dismiss",
          textColor: Colors.red,
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        progress = "Permission Denied!";
        _onPressed = () {
          downloadFile(context);
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return SafeArea(
      child: ThemeWrapper(builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          key: _scaffoldKey,
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFFD90506),
            onPressed: () async {
              downloadFile(context);
            },
            child: SvgPicture.asset(
              "assets/icons/download.svg",
              color: Colors.white,
            ),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: PDFView(
                      filePath: widget.file.path,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 16,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFB4ADAD),
                  radius: 22,
                  child: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white),
                    onPressed: () {
                      context
                          .read<BottomNavBarController>()
                          .changeNavBar(false);

                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  /// Request storage permission
  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      return result == PermissionStatus.granted;
    }
  }
}
