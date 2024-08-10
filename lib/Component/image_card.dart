import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  const ImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, imageUrl)=>Center(child: CircularProgressIndicator(),),
      errorWidget: (context, imageUrl, error)=>Center(child: Icon(Icons.error),),
    );
  }
}
