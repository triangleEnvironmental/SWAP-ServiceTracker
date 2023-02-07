
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/utils/index.dart';

class UserAvatar extends StatelessWidget {
  final String? url;
  final String? name;
  final double? height;
  final double? width;
  final String? defaultAsset;
  final BoxFit? fit;
  final List<ImageProvider>? previewImages;
  final int previewIndex;

  const UserAvatar(
    this.url, {
    Key? key,
    this.name,
    this.height,
    this.width,
    this.defaultAsset,
    this.fit,
    this.previewImages,
    this.previewIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultWidget = Image.asset(
      defaultAsset ?? AppStrings.avatarPlaceholder,
      fit: fit ?? BoxFit.cover,
      alignment: Alignment.center,
    );

    var onTap = previewImages != null && previewImages!.isNotEmpty
        ? () {
            viewPhoto(
              images: previewImages!,
              initIndex: previewIndex,
            );
          }
        : null;

    if (url == null) {
      return GestureDetector(
        onTap: onTap,
        child: defaultWidget,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: url!,
        height: height,
        width: width,
        placeholder: (context, url) => defaultWidget,
        errorWidget: (context, url, error) => defaultWidget,
        fit: fit ?? BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}