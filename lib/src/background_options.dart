import 'dart:ui';

/// {@template background_options}
/// Options describing how to paint the background.
/// {@endtemplate}
class BackgroundOptions {
  /// {@macro background_options}
  const BackgroundOptions({
    this.color,
    this.opacity,
    this.blurEffect,
  });

  /// If non-null, fill the background with the [color].
  final Color? color;

  /// If non-null, apply the [opacity] for the background's [color].
  final double? opacity;

  /// If non-null, apply blur effect to the background.
  final BlurEffect? blurEffect;
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
