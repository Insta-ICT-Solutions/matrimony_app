import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  const ImageCard({super.key, required this.imageUrl, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0), // Optional: To give rounded corners
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width != null ? width : double.infinity,
        height: height != null ? height : double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, imageUrl) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, imageUrl, error) => Center(child: Icon(Icons.error)),
      ),
    );
  }
}
