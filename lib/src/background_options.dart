import 'dart:ui';

import 'package:flutter/widgets.dart';

/// {@template background_options}
/// Options describing how to paint the background.
/// {@endtemplate}
class BackgroundOptions {
  /// {@macro background_options}
  const BackgroundOptions({
    this.color,
    this.opacity,
    this.blurEffect,
    this.borderClipper,
  });

  /// If non-null, fill the background with the [color].
  final Color? color;

  /// If non-null, apply the [opacity] for the background's [color].
  final double? opacity;

  /// If non-null, apply blur effect to the background.
  final BlurEffect? blurEffect;

  /// If non-null, clip borders of the background.
  final BorderClipper? borderClipper;
}

/// {@template blur_effect}
/// Options describing how to apply a Gaussian blur.
/// {@endtemplate}
class BlurEffect {
  /// {@macro blur_effect}
  const BlurEffect({
    this.sigmaX = 0,
    this.sigmaY = 0,
    this.tileMode = TileMode.clamp,
  });

  /// Standard deviation in X direction.
  ///
  /// Defaults to 0.
  final double sigmaX;

  /// Standard deviation in Y direction.
  ///
  /// Defaults to 0.
  final double sigmaY;

  /// Defines what happens at the edge of a gradient or the sampling
  /// of a source image in an [ImageFilter].
  ///
  /// Defaults to [TileMode.clamp].
  final TileMode tileMode;

  /// Returns an image filter that applies a Gaussian blur.
  ImageFilter get filter {
    return ImageFilter.blur(
      sigmaX: sigmaX,
      sigmaY: sigmaY,
      tileMode: tileMode,
    );
  }
}

/// {@template border_clipper}
/// Options describing how to clip the background.
/// {@endtemplate}
class BorderClipper {
  /// {@macro border_clipper}
  const BorderClipper({
    this.borderRadius = BorderRadius.zero,
    this.clipper,
    this.clipBehavior = Clip.antiAlias,
  });

  /// The border radius of the rounded corners.
  ///
  /// This value is ignored if [clipper] is non-null.
  /// Defaults to [BorderRadius.zero].
  final BorderRadiusGeometry borderRadius;

  /// If non-null, determines which clip to use.
  final CustomClipper<RRect>? clipper;

  /// {@macro flutter.rendering.ClipRectLayer.clipBehavior}
  ///
  /// Defaults to [Clip.antiAlias].
  final Clip clipBehavior;
}
