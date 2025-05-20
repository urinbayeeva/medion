import 'package:flutter/material.dart';
import 'package:medion/presentation/styles/style.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewPage extends StatelessWidget {
  final String imagePath;

  const ImagePreviewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: PhotoView(
              imageProvider: AssetImage(imagePath),
              backgroundDecoration: const BoxDecoration(color: Colors.white),
            ),
          ),
          Positioned(
            top: 60,
            right: 16,
            child: CircleAvatar(
              backgroundColor: Style.neutral400,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
