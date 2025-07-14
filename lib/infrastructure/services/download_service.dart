import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medion/presentation/pages/profile/inner_pages/wallet_page.dart';
import 'package:medion/presentation/styles/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileDownloadService {
  final Dio _dio = Dio(BaseOptions())..interceptors.add(LogInterceptor());

  Future<void> downloadPDFWithProgress({
    required BuildContext context,
    required String url,
    required String fileName,
    required CustomColorSet colors,
    String fileType = '.pdf',
  }) async {
    OverlayEntry? overlayEntry;
    final progressNotifier = ValueNotifier<int>(0); // 👈 progress notifier

    try {
      if (!await _requestStoragePermission(context)) {
        print("❌ Permission berilmadi");
        return;
      }

      final directory = await _getDownloadsDirectory();
      final appDir = Directory("${directory.path}/Medion");

      if (!await appDir.exists()) {
        await appDir.create(recursive: true);
      }

      String filePath = "${appDir.path}/";
      if (fileName.contains("pdf")) {
        filePath = "${appDir.path}/$fileName";
      } else {
        filePath = "${appDir.path}/$fileName$fileType";
      }

      overlayEntry = OverlayEntry(
        builder: (context) {
          return Positioned(
            top: 100,
            left: 50,
            right: 50,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: colors.neutral300, borderRadius: BorderRadius.circular(12)),
                child: ValueListenableBuilder<int>(
                  valueListenable: progressNotifier,
                  builder: (_, progress, __) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Downloading: $progress%"),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: progress / 100,
                          color: colors.error500,
                          backgroundColor: colors.error300.withValues(alpha: 0.3),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      );
      Overlay.of(context).insert(overlayEntry);

      final result = await _dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = (received / total * 100).toInt();
            progressNotifier.value = progress;
          }
        },
      ).then(
        (val) {
          log("value: ${val.data}");

          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (ctx) => PdfViewScreen(path: filePath)),
          );
        },
      );

      log("Download Url $url");
      log("Download Result status code ${result.statusCode}");
      log("Download Result data: ${result.data}");
      log("Download Result data Runtime type: ${result.data.runtimeType}");
      log("Download Result data: ${result.data}");
      log("Download Result status Message: ${result.statusMessage}");

      overlayEntry.remove();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Download completed! File saved to: $filePath",
            style: TextStyle(color: colors.darkMode900),
          ),
          backgroundColor: colors.neutral300,
        ),
      );
    } catch (e) {
      if (overlayEntry != null && overlayEntry.mounted) {
        overlayEntry.remove();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Failed to download: $e",
            style: TextStyle(color: colors.darkMode900),
          ),
          backgroundColor: colors.neutral300,
        ),
      );
    }
  }

  Future<bool> _requestStoragePermission(BuildContext context) async {
    if (!Platform.isAndroid) return true;
    final status = await Permission.manageExternalStorage.request();

    if (status.isGranted) {
      log("Status: ${status.name}");
      return true;
    }

    if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Storage permission is required to download files."),
          action: SnackBarAction(
            label: "Open App Setting",
            onPressed: () async => await openAppSettings(),
          ),
        ),
      );
      return false;
    }

    if (status.isPermanentlyDenied) {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Permission Required"),
          content: const Text(
            "Storage permission is permanently denied. Please enable it manually from app settings.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
              child: const Text("Open Settings"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
          ],
        ),
      );
      return false;
    }

    return false;
  }

  Future<Directory> _getDownloadsDirectory() async {
    if (Platform.isAndroid) {
      // For Android, use the external storage downloads directory
      return Directory('/storage/emulated/0/Download');
    } else if (Platform.isIOS) {
      // For iOS, use the app's document directory
      return await getApplicationDocumentsDirectory();
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
