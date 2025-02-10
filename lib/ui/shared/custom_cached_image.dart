import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Alignment? alignment;
  final EdgeInsets? topMargin;
  final Color? color;

  const ImageNetworkWidget({
    super.key,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.topMargin,
    required this.url,
    this.alignment,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) return const SizedBox.shrink();
    return CachedNetworkImage(
      fadeInCurve: Curves.easeInOut,
      height: height,
      width: width,
      fit: fit,
      imageUrl: url!,
      alignment: alignment ?? Alignment.center,
      errorListener: (value) {
        debugPrint("Error loading image: $value");
      },
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            value: downloadProgress.progress,
            backgroundColor: color,
          ),
        );
      },
      errorWidget: (context, url, error) => Container(
        margin: topMargin,
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.image,
            size: 30,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
