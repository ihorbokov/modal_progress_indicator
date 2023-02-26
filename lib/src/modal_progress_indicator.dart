import 'package:flutter/widgets.dart';
import 'package:modal_progress_indicator/src/background_options.dart';

/// {@template modal_progress_indicator}
/// Creates a modal progress indicator that blocks access to a wrapped widget
/// and its subtree.
///
/// The [indicator] can be any widget.
/// Use [options] in order to customise background.
/// {@endtemplate}
class ModalProgressIndicator extends StatelessWidget {
  /// {@macro modal_progress_indicator}
  const ModalProgressIndicator({
    required this.visible,
    required this.child,
    this.indicator,
    this.alignment = Alignment.center,
    this.dismissible = false,
    this.onDismiss,
    this.options,
    Key? key,
  }) : super(key: key);

  /// Switches between showing the [indicator] or hiding it.
  final bool visible;

  /// The widget below this widget in the tree.
  final Widget child;

  /// A progress indicator.
  final Widget? indicator;

  /// Defines how to align the [indicator].
  ///
  /// Defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// {@macro flutter.widgets.modalBarrier.dismissible}
  ///
  /// Defaults to false.
  final bool dismissible;

  /// {@macro flutter.widgets.modalBarrier.onDismiss}
  final VoidCallback? onDismiss;

  /// If non-null, the style to use for the background.
  final BackgroundOptions? options;

  @override
  Widget build(BuildContext context) {
    Widget? background;
    Widget? foreground;
    if (visible) {
      background = ModalBarrier(
        color: options?.color,
        dismissible: dismissible,
        onDismiss: onDismiss,
      );
      if (options?.opacity != null) {
        background = Opacity(
          opacity: options!.opacity!,
          child: background,
        );
      }
      if (options?.blurEffect != null) {
        background = BackdropFilter(
          filter: options!.blurEffect!.filter,
          child: background,
        );
      }
      if (options?.borderClipper != null) {
        background = ClipRRect(
          borderRadius: options!.borderClipper!.borderRadius,
          clipper: options!.borderClipper?.clipper,
          clipBehavior: options!.borderClipper!.clipBehavior,
          child: background,
        );
      }
      if (indicator != null) {
        foreground = Align(
          alignment: alignment,
          child: indicator,
        );
      }
    }
    return Stack(
      children: [
        child,
        if (background != null)
          Positioned.fill(
            child: background,
          ),
        if (foreground != null)
          Positioned.fill(
            child: foreground,
          ),
      ],
    );
  }
}
