import 'package:flutter/material.dart';
import 'package:flutter_test_guia/core/theme/app_theme.dart';
import 'package:flutter_test_guia/ui/shared/custom_cached_image.dart';

class ImagesPage extends StatelessWidget {
  final List<String> images;

  const ImagesPage({super.key, required this.images});

  Widget _buildSmallImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        AppTheme.defaultBorder,
      ),
      child: ImageNetworkWidget(
        url: url,
        height: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suites"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: images.length,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppTheme.defaultBorder,
                ),
                child: ImageNetworkWidget(
                  url: images[index],
                  height: 200,
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildSmallImage(images[index]),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildSmallImage(
                      images[(index + 1) % images.length],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
