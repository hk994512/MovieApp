import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget loadImage(String imageUrl, bool sizedImage) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
        ),
        child: sizedImage
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 150,
                height: 200,
              )
            : null),
    placeholder: (context, url) => const CircularProgressIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
