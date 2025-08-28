export './assets/network_assets.dart';
export './assets/png_assets.dart';
export './assets/svg_assets.dart';

import 'package:base_project/core/component/image/design_assets.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:base_project/core/component/image/assets/network_assets.dart';
import 'package:base_project/core/component/image/assets/png_assets.dart';
import 'package:base_project/core/component/image/assets/svg_assets.dart';
import 'package:base_project/core/component/image/assets/file_assets_io.dart'
    if (dart.library.html) 'package:base_project/core/component/image/assets/file_assets_web.dart';

class DesignImage extends StatelessWidget {
  const DesignImage(
    this.asset, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.shape,
    this.border,
    this.borderRadius,
    this.clipBehavior = Clip.antiAlias,
    this.alignment = Alignment.center,
    this.failedWidget,
    this.loadingWidget,
    this.cacheMaxAge,
  });

  final DesignAssets asset;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BoxShape? shape;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Clip clipBehavior;
  final Alignment alignment;
  final Widget? failedWidget;
  final Widget? loadingWidget;
  final Duration? cacheMaxAge;

  Widget get _loadingWidget => Skeletonizer(
    enabled: true,
    effect: ShimmerEffect(
      baseColor: AppColor.neutral[700]!,
      highlightColor: AppColor.white,
      duration: const Duration(milliseconds: 1500),
    ),
    child: Skeleton.leaf(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.zero,
          color: Colors.grey,
        ),
      ),
    ),
  );

  Widget get _failedWidget => LayoutBuilder(
    builder: (context, constraints) {
      double width = constraints.maxWidth.isInfinite
          ? 100.0
          : constraints.maxWidth;
      double height = constraints.maxHeight.isInfinite
          ? 100.0
          : constraints.maxHeight;

      return Skeleton.leaf(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: AppColor.neutral[700],
            shape: shape ?? BoxShape.rectangle,
          ),
          child: Icon(Icons.broken_image, color: AppColor.blackGrey, size: 24),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    if (asset is NetworkAssets) {
      final networkAssets = asset as NetworkAssets;
      return ExtendedImage.network(
        networkAssets.url,
        width: width,
        height: height,
        fit: fit,
        shape: shape ?? BoxShape.rectangle,
        border: border,
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        alignment: alignment,
        cacheMaxAge: cacheMaxAge ?? const Duration(days: 30),
        loadStateChanged: (state) {
          if (state.extendedImageLoadState == LoadState.failed) {
            return failedWidget ?? _failedWidget;
          }

          if (state.extendedImageLoadState == LoadState.loading) {
            return loadingWidget ?? _loadingWidget;
          }

          return null;
        },
      );
    }

    if (asset is PngAssets) {
      final localAssets = asset as PngAssets;
      return ExtendedImage.asset(
        localAssets.path,
        width: width,
        height: height,
        fit: fit,
        shape: shape ?? BoxShape.rectangle,
        border: border,
        borderRadius: borderRadius,
        clipBehavior: clipBehavior,
        alignment: alignment,
        imageCacheName: localAssets.path,
        loadStateChanged: (state) {
          if (state.extendedImageLoadState == LoadState.failed) {
            return failedWidget ?? _failedWidget;
          }

          if (state.extendedImageLoadState == LoadState.loading) {
            return loadingWidget ?? _loadingWidget;
          }

          return null;
        },
      );
    }

    if (asset is SvgAssets) {
      final localAssets = asset as SvgAssets;
      return SvgPicture.asset(
        localAssets.path,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        clipBehavior: clipBehavior,
        alignment: alignment,
        errorBuilder: (_, __, ___) {
          return failedWidget ?? _failedWidget;
        },
        placeholderBuilder: (_) {
          return loadingWidget ?? _loadingWidget;
        },
      );
    }

    if (asset is FileAssets) {
      if (kIsWeb) {
        throw "Web cannot use FileAssets";
      }

      final localAssets = asset as FileAssets;
      return ExtendedImage.file(
        localAssets.file,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        clipBehavior: clipBehavior,
        alignment: alignment,
        shape: shape ?? BoxShape.rectangle,
      );
    }

    return const SizedBox();
  }
}
