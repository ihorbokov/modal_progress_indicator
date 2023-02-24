import 'package:flutter/widgets.dart';
import 'package:modal_progress_indicator/src/background_options.dart';

/// {@template modal_progress_indicator}
/// A modal progress indicator that blocks access to widgets while it's visible.
///
/// The [indicator] can be any widget.
/// Use [options] in order to customise background.
/// {@endtemplate}
class ModalProgressIndicator extends StatelessWidget {
  /// {@macro modal_progress_indicator}
  const ModalProgressIndicator({
    required this.visible,
    this.indicator,
    this.alignment = Alignment.center,
    this.dismissible = false,
    this.onDismiss,
    this.options,
    Key? key,
  }) : super(key: key);

  /// Switches between showing the [indicator] or hiding it.
  final bool visible;

  /// Defines how to align the [indicator].
  ///
  /// Defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// A progress indicator.
  final Widget? indicator;

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
    if (visible) {
      final foreground = Align(
        alignment: alignment,
        child: indicator,
      );

      Widget background = ModalBarrier(
        color: options?.color,
        dismissible: dismissible,
        onDismiss: onDismiss,
      );
      if (options != null && options!.opacity != 1) {
        background = Opacity(
          opacity: options!.opacity,
          child: background,
        );
      }
      if (options?.blurEffect != null) {
        background = BackdropFilter(
          filter: options!.blurEffect!.filter,
          child: background,
        );
      }
      return Stack(
        children: [
          background,
          foreground,
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
