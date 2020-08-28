library speed_dial_fab_widget;

import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedDialFabWidget extends StatefulWidget {
  final Color secondaryBackgroundColor;
  final Color secondaryForegroundColor;
  final Color primaryBackgroundColor;
  final Color primaryForegroundColor;
  final IconData principalIconCollapse;
  final IconData principalIconExpand;
  final double rotateAngle;
  final List<IconData> secondaryIconsList;
  final List<String> secondaryIconsText;
  final List<Function> secondaryIconsOnPress;

  SpeedDialFabWidget({
    this.secondaryBackgroundColor,
    this.secondaryForegroundColor,
    this.primaryBackgroundColor,
    this.primaryForegroundColor,
    this.principalIconExpand,
    this.rotateAngle,
    this.principalIconCollapse,
    @required this.secondaryIconsList,
    @required this.secondaryIconsOnPress,
    this.secondaryIconsText,
  });

  @override
  State createState() => SpeedDialFabWidgetState();
}

class SpeedDialFabWidgetState extends State<SpeedDialFabWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
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
              overflow: Overflow.visible,
              children: <Widget>[
                FloatingActionButton(
                  elevation: 10,
                  tooltip: (widget.secondaryIconsText != null)
                      ? widget.secondaryIconsText[index]
                      : null,
                  heroTag: null,
                  mini: true,
                  backgroundColor: (widget.secondaryBackgroundColor != null)
                      ? widget.secondaryBackgroundColor
                      : Colors.white,
                  child: Icon(
                    widget.secondaryIconsList[index],
                    color: (widget.secondaryForegroundColor != null)
                        ? widget.secondaryForegroundColor
                        : Colors.black,
                  ),
                  onPressed: widget.secondaryIconsOnPress[index],
                ),
                Positioned(
                  right: 55.0,
                  top: 5,
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    shadowColor: (widget.secondaryForegroundColor != null)
                        ? widget.secondaryForegroundColor
                        : Colors.black,
                    color: (widget.secondaryBackgroundColor != null)
                        ? widget.secondaryBackgroundColor
                        : Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(9),
                      child: Text(
                        (widget.secondaryIconsText != null)
                            ? widget.secondaryIconsText[index]
                            : "",
                        style: TextStyle(
                          color: (widget.secondaryForegroundColor != null)
                              ? widget.secondaryForegroundColor
                              : Colors.black,
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
            elevation: 10,
            backgroundColor: (widget.primaryBackgroundColor != null)
                ? widget.primaryBackgroundColor
                : Colors.white,
            heroTag: null,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform: Matrix4.rotationZ(_controller.value *
                      ((widget.rotateAngle == null)
                          ? math.pi
                          : widget.rotateAngle)),
                  alignment: FractionalOffset.center,
                  child: Icon(
                    _controller.isDismissed
                        ? (widget.principalIconExpand != null)
                            ? widget.principalIconExpand
                            : Icons.expand_less
                        : (widget.principalIconCollapse != null)
                            ? widget.principalIconCollapse
                            : Icons.expand_less,
                    color: (widget.primaryForegroundColor != null)
                        ? widget.primaryForegroundColor
                        : Colors.black,
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
