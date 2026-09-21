library speed_dial_fab_widget;

import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

// `withValues` is not available on older Flutter versions supported by this
// package. Keep the compatibility implementation in one place until the
// minimum Flutter version can be raised without breaking existing consumers.
Color _withOpacityCompat(Color color, double opacity) {
  // ignore: deprecated_member_use
  return color.withOpacity(opacity);
}

/// The arrangement used for secondary actions.
enum SpeedDialLayout { vertical, horizontal, radial }

/// The direction used by vertical and horizontal arrangements.
enum SpeedDialDirection { up, down, left, right }

class SpeedDialFabWidget extends StatefulWidget {
  final Color secondaryBackgroundColor;
  final Color secondaryForegroundColor;
  final Color primaryBackgroundColor;
  final Color primaryForegroundColor;
  final double primaryElevation;
  final double secondaryElevation;
  final IconData primaryIconCollapse;
  final IconData primaryIconExpand;
  final double rotateAngle;
  final List<IconData> secondaryIconsList;
  final List<String>? secondaryIconsText;
  final List<Function> secondaryIconsOnPress;

  /// Length of the expand and collapse animation.
  final Duration animationDuration;

  /// Arrangement of the secondary actions.
  final SpeedDialLayout layout;

  /// Direction for [SpeedDialLayout.vertical] and [SpeedDialLayout.horizontal].
  final SpeedDialDirection direction;

  /// Distance from the primary action's center in radial mode.
  final double radialRadius;

  /// First angle in radians for radial mode. The default fans up and left,
  /// which keeps actions visible when the FAB is in the bottom-right corner.
  final double radialStartAngle;

  /// Sweep in radians for radial mode. Negative values travel counter-clockwise.
  final double radialSweepAngle;

  /// Applies a translucent, blurred glass surface to the action buttons.
  /// This uses Flutter's [BackdropFilter], including on iOS.
  final bool glassEffect;

  /// Color mixed into a glass action surface.
  final Color glassColor;

  /// Opacity of [glassColor] when [glassEffect] is enabled.
  final double glassOpacity;

  /// Blur strength of a glass action surface.
  final double glassBlurSigma;

  /// Preserves the original API for blurring the screen behind the dial.
  final bool blurBackground;

  /// Blur strength used by [blurBackground].
  final double blurBackgroundSigma;

  const SpeedDialFabWidget({
    super.key,
    this.secondaryBackgroundColor = Colors.white,
    this.secondaryForegroundColor = Colors.black,
    this.primaryBackgroundColor = Colors.white,
    this.primaryForegroundColor = Colors.black,
    this.primaryIconCollapse = Icons.expand_less,
    this.primaryIconExpand = Icons.expand_less,
    this.rotateAngle = math.pi,
    required this.secondaryIconsList,
    required this.secondaryIconsOnPress,
    this.secondaryIconsText,
    this.primaryElevation = 5.0,
    this.secondaryElevation = 10.0,
    this.animationDuration = const Duration(milliseconds: 500),
    this.layout = SpeedDialLayout.vertical,
    this.direction = SpeedDialDirection.up,
    this.radialRadius = 112.0,
    this.radialStartAngle = math.pi,
    this.radialSweepAngle = -math.pi / 2,
    this.glassEffect = false,
    this.glassColor = Colors.white,
    this.glassOpacity = 0.22,
    this.glassBlurSigma = 14.0,
    this.blurBackground = false,
    this.blurBackgroundSigma = 5.0,
  })  : assert(secondaryIconsList.length == secondaryIconsOnPress.length),
        assert(secondaryIconsText == null || secondaryIconsText.length == secondaryIconsList.length),
        assert(radialRadius >= 0),
        assert(glassOpacity >= 0 && glassOpacity <= 1),
        assert(glassBlurSigma >= 0),
        assert(blurBackgroundSigma >= 0);

  @override
  State<SpeedDialFabWidget> createState() => _SpeedDialFabWidgetState();
}

class _SpeedDialFabWidgetState extends State<SpeedDialFabWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  OverlayEntry? _backgroundOverlay;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
  }

  @override
  void didUpdateWidget(covariant SpeedDialFabWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animationDuration != widget.animationDuration) {
      _controller.duration = widget.animationDuration;
    }
  }

  void forceExpandSecondaryFab() {
    _showBackgroundBlur();
    _controller.forward();
  }

  void forceCollapseSecondaryFab() {
    _controller.reverse().whenComplete(_removeBackgroundBlur);
  }

  void _showBackgroundBlur() {
    if (!widget.blurBackground || _backgroundOverlay != null) return;
    _backgroundOverlay = OverlayEntry(
      builder: (context) => IgnorePointer(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.blurBackgroundSigma,
            sigmaY: widget.blurBackgroundSigma,
          ),
          child: const SizedBox.expand(),
        ),
      ),
    );
    Overlay.of(context, rootOverlay: true).insert(_backgroundOverlay!);
  }

  void _removeBackgroundBlur() {
    _backgroundOverlay?.remove();
    _backgroundOverlay = null;
  }

  @override
  void dispose() {
    _removeBackgroundBlur();
    _controller.dispose();
    super.dispose();
  }

  bool get _horizontal => widget.layout == SpeedDialLayout.horizontal;

  bool get _reverseActions =>
      widget.direction == SpeedDialDirection.up ||
      widget.direction == SpeedDialDirection.left;

  Widget _surface({required Widget child, required bool primary}) {
    final color = primary
        ? widget.primaryBackgroundColor
        : widget.secondaryBackgroundColor;
    final elevation = primary
        ? widget.primaryElevation
        : widget.secondaryElevation;
    final button = FloatingActionButton(
      elevation: elevation,
      heroTag: null,
      mini: !primary,
      backgroundColor: widget.glassEffect
          ? _withOpacityCompat(widget.glassColor, widget.glassOpacity)
          : color,
      onPressed: child is _ActionIcon
          ? child.onPressed
          : primary
              ? (_controller.isDismissed
                  ? forceExpandSecondaryFab
                  : forceCollapseSecondaryFab)
              : null,
      child: child,
    );
    if (!widget.glassEffect) return button;
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.glassBlurSigma,
          sigmaY: widget.glassBlurSigma,
        ),
        child: button,
      ),
    );
  }

  Widget _primary() => _surface(
        primary: true,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform.rotate(
            angle: _controller.value * widget.rotateAngle,
            child: Icon(
              _controller.isDismissed
                  ? widget.primaryIconExpand
                  : widget.primaryIconCollapse,
              color: widget.primaryForegroundColor,
            ),
          ),
        ),
      );

  Widget _secondary(int index) {
    final label = widget.secondaryIconsText?[index];
    final icon = _ActionIcon(
      icon: widget.secondaryIconsList[index],
      color: widget.secondaryForegroundColor,
      onPressed: () {
        widget.secondaryIconsOnPress[index]();
        forceCollapseSecondaryFab();
      },
    );
    final action = _surface(primary: false, child: icon);
    final content = label == null || label.isEmpty
        ? action
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [action, _label(label)],
          );
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0,
          1 - index / math.max(1, widget.secondaryIconsList.length) / 2,
          curve: Curves.easeOut,
        ),
      ),
      child: content,
    );
  }

  Widget _label(String text) {
    final color = widget.glassEffect
        ? _withOpacityCompat(widget.glassColor, widget.glassOpacity)
        : widget.secondaryBackgroundColor;
    final label = Material(
      color: color,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Text(
          text,
          style: TextStyle(
            color: widget.secondaryForegroundColor,
            fontWeight: FontWeight.w900,
            fontSize: 15,
            letterSpacing: .3,
          ),
        ),
      ),
    );
    return widget.glassEffect
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: widget.glassBlurSigma,
                sigmaY: widget.glassBlurSigma,
              ),
              child: label,
            ),
          )
        : label;
  }

  Widget _linear() {
    final actions = List<Widget>.generate(
      widget.secondaryIconsList.length,
      _secondary,
    );
    final children = <Widget>[];
    if (_reverseActions) {
      children.addAll(actions);
      children.add(_primary());
    } else {
      children.add(_primary());
      children.addAll(actions);
    }
    return Flex(
      direction: _horizontal ? Axis.horizontal : Axis.vertical,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _radial() {
    final radius = widget.radialRadius;
    final size = radius + 56;
    final center = radius + 28;
    final count = widget.secondaryIconsList.length;
    final children = <Widget>[
      Positioned(left: radius, top: radius, child: _primary()),
    ];
    for (var index = 0; index < count; index++) {
      final fraction = count <= 1 ? 0.5 : index / (count - 1);
      final angle = widget.radialStartAngle + widget.radialSweepAngle * fraction;
      final x = center + math.cos(angle) * radius - 28;
      final y = center + math.sin(angle) * radius - 28;
      children.add(Positioned(left: x, top: y, child: _secondary(index)));
    }
    return SizedBox(
      width: size,
      height: size,
      child: Stack(clipBehavior: Clip.none, children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.layout == SpeedDialLayout.radial ? _radial() : _linear();
  }
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Icon(icon, color: color);
}
