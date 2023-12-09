library speed_dial_fab_widget;

import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedDialFabWidget extends StatefulWidget {
  /// [secondaryBackgroundColor] Changes the background color of the secondary FAB button.
  /// The default value is [Colors.white]
  final Color secondaryBackgroundColor;

  /// [secondaryForegroundColor] Changes the foreground color of the secondary FAB button.
  /// The default value is [Colors.black]
  final Color secondaryForegroundColor;

  /// [primaryBackgroundColor] Changes the background color of the primary FAB button.
  /// The default value is [Colors.white]
  final Color primaryBackgroundColor;

  /// [primaryForegroundColor] Changes the foreground color of the primary FAB button.
  /// The default value is [Colors.black]
  final Color primaryForegroundColor;

  /// [primaryElevation] Changes the elevation of the primary FAB button.
  /// The default value is [10.0]
  final double primaryElevation;

  /// [secondaryElevation] Changes the elevation of the secondary FAB button.
  /// The default value is [10.0]
  final double secondaryElevation;

  /// [primaryIconCollapse] Changes primary icon when it is collapsed
  /// The default value is [Icons.expand_less]
  final IconData primaryIconCollapse;

  /// [primaryIconExpand] Change primary icon when it is expanded
  /// The default value is [Icons.expand_less]
  final IconData primaryIconExpand;

  /// [rotateAngle] Change the rotation angle to animate primary FAB when clicked
  /// The default value is [math.pi]
  final double rotateAngle;

  /// Required: [secondaryIconsList] Change the list of icons of secondary FAB, , should be the same size of @secondaryIconsText and @secondaryIconsOnPress
  /// Should have the same size of [secondaryIconsOnPress] and [secondaryIconsList]
  final List<IconData> secondaryIconsList;

  /// [secondaryIconsText] Change the list of text of secondary FAB, should be the same size of @secondaryIconsList and @secondaryIconsOnPress
  /// This will be the tooltip of the secondary FAB, by default there is no tooltip.
  /// if not null, should have the same size of [secondaryIconsOnPress] and [secondaryIconsList]
  final List<String>? secondaryIconsText;

  /// Required: [secondaryIconsOnPress] Change the list of onPress action, should be the same size of @secondaryIconsList and @secondaryIconsText
  /// Should have the same size of [secondaryIconsText] and [secondaryIconsList]
  final List<Function> secondaryIconsOnPress;

  SpeedDialFabWidget({
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
  });

  @override
  State createState() => SpeedDialFabWidgetState();
}

class SpeedDialFabWidgetState extends State<SpeedDialFabWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    if (widget.secondaryIconsList.length !=
        widget.secondaryIconsOnPress.length) {
      throw ("secondaryIconsList should have the same length of secondaryIconsOnPress");
    }
    if (widget.secondaryIconsText != null) {
      if (widget.secondaryIconsText?.length !=
          widget.secondaryIconsOnPress.length) {
        throw ("secondaryIconsText should have the same length of secondaryIconsOnPress");
      }
    }

    super.initState();
  }

  /// [forceExpandSecondaryFab] Use this to force animate expand the secondary fab
  /// Avoid using this during the animation
  void forceExpandSecondaryFab() {
    _controller.forward();
  }

  /// [forceCollapseSecondaryFab] Use this to force collapse the secondary fab.
  /// Avoid using this during the animation
  void forceCollapseSecondaryFab() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.secondaryIconsList.length, (int index) {
        Widget secondaryFAB = Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: Interval(
                0.0,
                1.0 - index / widget.secondaryIconsList.length / 2.0,
                curve: Curves.easeOut,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                FloatingActionButton(
                  elevation: widget.secondaryElevation,
                  tooltip: widget.secondaryIconsText![index],
                  heroTag: null,
                  mini: true,
                  backgroundColor: widget.secondaryBackgroundColor,
                  child: Icon(
                    widget.secondaryIconsList[index],
                    color: widget.secondaryForegroundColor,
                  ),
                   onPressed: () {
                    widget.secondaryIconsOnPress[index]();
                     _controller.reverse();
                  },
                ),
                Positioned(
                  right: 51.0,
                  top: 5,
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0,
                    shadowColor: widget.secondaryForegroundColor,
                    color: widget.secondaryBackgroundColor,
                    child: Padding(
                      padding: EdgeInsets.all(9),
                      child: Text(
                        widget.secondaryIconsText?[index] ?? "",
                        style: TextStyle(
                          color: widget.secondaryForegroundColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        return secondaryFAB;
      }).toList()
        ..add(
          FloatingActionButton(
            elevation: widget.primaryElevation,
            clipBehavior: Clip.antiAlias,
            backgroundColor: widget.primaryBackgroundColor,
            heroTag: null,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  transform: Matrix4.rotationZ(
                    _controller.value * (widget.rotateAngle),
                  ),
                  alignment: FractionalOffset.center,
                  child: Icon(
                    _controller.isDismissed
                        ? widget.primaryIconExpand
                        : widget.primaryIconCollapse,
                    color: widget.primaryForegroundColor,
                  ),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ),
    );
  }
}
