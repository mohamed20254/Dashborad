import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui_web' as ui_web; // لتسجيل PlatformView
import 'package:web/web.dart' as web;

class WebImageWidget extends StatelessWidget {
  const WebImageWidget({
    required this.imageUrl,
    this.width = 200,
    this.height = 200,
    super.key,
  });
  final String imageUrl;
  final double width;
  final double height;

  static final Set<String> _registeredViewTypes = {};

  @override
  Widget build(final BuildContext context) {
    final viewType = 'web-img-${imageUrl.hashCode}';

    // تسجيل factory مرة واحدة فقط لكل URL
    if (!_registeredViewTypes.contains(viewType)) {
      _registeredViewTypes.add(viewType);
      _registerImageFactory(viewType);
    }

    return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView(
        viewType: viewType,
        onPlatformViewCreated: (final viewId) {
          final element =
              ui_web.platformViewRegistry.getViewById(viewId)
                  as web.HTMLImageElement;
          // Optional: إضافة تأثير عند تحميل الصورة
          element.style.border = '2px solid #2196F3';
        },
      ),
    );
  }

  void _registerImageFactory(final String viewType) {
    ui_web.platformViewRegistry.registerViewFactory(viewType, (
      final int viewId, {
      final Object? params,
    }) {
      final img = web.HTMLImageElement()
        ..src = imageUrl
        ..width = width.toInt()
        ..height = height.toInt()
        ..style.objectFit = 'cover'; // يشبه BoxFit.cover
      return img;
    });
  }
}
