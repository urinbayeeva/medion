import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

class FileDownloadService {
  final Dio _dio = Dio(BaseOptions())..interceptors.add(LogInterceptor());

  Future<void> downloadPDFWithProgress(
    BuildContext context,
    String url,
    String fileName,
    Color backgroundColor,
    Color foregroundColor,
  ) async {
    OverlayEntry? overlayEntry;

    try {
      // Request Storage Permissions
      if (!await _requestStoragePermission(context)) return;

      // Get the directory for saving the file
      final directory = await _getDownloadsDirectory();
      final appDir = Directory("${directory.path}/Medion");

      // Create the Medion folder if it doesn't exist
      if (!await appDir.exists()) {
        await appDir.create(recursive: true);
      }

      final filePath = "${appDir.path}/$fileName";

      // Show progress overlay
      overlayEntry = _createProgressOverlay(
        context,
        progress: 0,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      );
      Overlay.of(context).insert(overlayEntry);

      // Start the download
      await _dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = (received / total * 100).toInt();
            print("Downloading: $progress%");
            overlayEntry = _updateProgressOverlay(
              overlayEntry!,
              context,
              progress: progress,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
            );
          }
        },
      );

      // Download complete
      overlayEntry?.remove();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Download completed! File saved to: $filePath",
            style: TextStyle(color: foregroundColor),
          ),
          backgroundColor: backgroundColor,
        ),
      );
    } catch (e) {
      // Handle errors
      overlayEntry?.remove();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Failed to download: $e",
            style: TextStyle(color: foregroundColor),
          ),
          backgroundColor: backgroundColor,
        ),
      );
    }
  }

  Future<bool> _requestStoragePermission(BuildContext context) async {
    if (Platform.isAndroid) {
      // Request storage or manage storage permissions
      final status = await Permission.storage.request();
      if (status.isGranted) {
        return true;
      } else if (status.isPermanentlyDenied) {
        // Open app settings for manually granting permission
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Permission Required"),
            content: Text("Storage permission is required to save the file. Please enable it in settings."),
            actions: [
              TextButton(
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
                child: Text("Open Settings"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel"),
              ),
            ],
          ),
        );
        return false;
      }
      return false;
    }
    return true;
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

  OverlayEntry _createProgressOverlay(
    BuildContext context, {
    required int progress,
    required Color backgroundColor,
    required Color foregroundColor,
  }) {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 10,
          right: 10,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Downloading: $progress%",
                    style: TextStyle(color: foregroundColor),
                  ),
                  CircularProgressIndicator(
                    value: progress / 100,
                    color: foregroundColor,
                    strokeWidth: 2.5,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  OverlayEntry _updateProgressOverlay(
    OverlayEntry entry,
    BuildContext context, {
    required int progress,
    required Color backgroundColor,
    required Color foregroundColor,
  }) {
    entry.remove();
    return _createProgressOverlay(
      context,
      progress: progress,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    );
  }
}
