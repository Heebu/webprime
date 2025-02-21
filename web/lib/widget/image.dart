import 'dart:html';
import '../core/component.dart';
import '../helper/box_decoration.dart';

class ImageWidget extends Widget {
  final String src;
  final double? width;
  final double? height;
  final String fit;
  final BorderRadius borderRadius;
  final String? alt;
  final String? placeholder;
  final String? errorImage;

  ImageWidget({
    required this.src,
    this.width,
    this.height,
    this.fit = 'cover',
    this.borderRadius = const BorderRadius.all(0),
    this.alt,
    this.placeholder,
    this.errorImage,
  });

  @override
  Element build() {
    final image = ImageElement()
      ..src = placeholder ?? src
      ..alt = alt ?? 'Image'
      ..style.objectFit = fit
      ..style.borderRadius = '${borderRadius.cssValue}px';

    if (width != null) image.style.width = '${width}px';
    if (height != null) image.style.height = '${height}px';

    // Handle image loading error
    image.onError.listen((_) {
      if (errorImage != null) {
        image.src = errorImage!;
      }
    });

    // Replace placeholder with actual image
    if (placeholder != null) {
      image.onLoad.listen((_) {
        image.src = src;
      });
    }

    return image;
  }
}
