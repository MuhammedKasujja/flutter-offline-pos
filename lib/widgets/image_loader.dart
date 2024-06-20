import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String? imageUrl;
  final String placeholderImage;

  const ImageLoader({
    super.key,
    required this.imageUrl,
    required this.placeholderImage,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? '',
      loadingBuilder: (BuildContext context, Widget image,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return image;
        } else {
          return const CircularProgressIndicator(); // Show a loading indicator while loading
        }
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        // Display a placeholder image on error
        return Image.asset(placeholderImage);
      },
    );
  }
}
