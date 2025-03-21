import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileHandler {
  static Future<Directory> getMedionDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    final medionDirectory = Directory('${directory.path}/medion');

    if (!await medionDirectory.exists()) {
      await medionDirectory.create(recursive: true);
    }
    return medionDirectory;
  }

  static Future<File> savePdf(String fileName, List<int> bytes) async {
    final medionDirectory = await getMedionDirectory();
    final filePath = '${medionDirectory.path}/$fileName';

    final file = File(filePath);
    return await file.writeAsBytes(bytes);
  }

}





Future<void> requestStoragePermission() async {
  if (Platform.isAndroid) {
    if (await Permission.photos.isDenied) {
      await Permission.photos.request();
    }
    if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }
  }
}
