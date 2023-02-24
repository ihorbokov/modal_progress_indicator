# Modal Progress Indicator

<p>
<a href="https://pub.dev/packages/modal_progress_indicator"><img src="https://img.shields.io/pub/v/modal_progress_indicator.svg" alt="Pub"></a>
<a href="https://pub.dev/packages/very_good_analysis"><img src="https://img.shields.io/badge/style-very_good_analysis-B22C89.svg" alt="style: very good analysis"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

Configurable modal progress indicator that blocks access to a wrapped widget and its subtree.

## Usage
Example of using `ModalProgressIndicator`:
```dart
ModalProgressIndicator(
  visible: true,
  indicator: CircularProgressIndicator(),
  options: BackgroundOptions(
    color: Colors.black,
    opacity: 0.5,
    blurEffect: BlurEffect(
      sigmaX: 1.5,
      sigmaY: 1.5,
    ),
  ),
  child: child,
)
```