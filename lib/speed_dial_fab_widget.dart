library speed_dial_fab_widget;

import 'package:flutter/material.dart';
import 'dart:math' as math;

class SpeedDialFabWidget extends StatefulWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData principalIconExpand;
  final IconData principalIconClose;
  final List<IconData> secondaryIconsList;
  final List<String> secondaryIconsTooltip;

  SpeedDialFabWidget({
    this.backgroundColor,
    this.foregroundColor,
    this.principalIconExpand,
    this.principalIconClose,
    @required this.secondaryIconsList,
    this.secondaryIconsTooltip,
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.secondaryIconsList.length, (int index) {
        Widget child = Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: Interval(
                  0.0, 1.0 - index / widget.secondaryIconsList.length / 2.0,
                  curve: Curves.easeOut),
            ),
            child: FloatingActionButton(
              tooltip: (widget.secondaryIconsTooltip == null)
                  ? null
                  : widget.secondaryIconsTooltip[index],
              heroTag: null,
              backgroundColor: (widget.backgroundColor == null)
                  ? widget.backgroundColor
                  : Colors.white,
              mini: true,
              child: Icon(
                widget.secondaryIconsList[index],
                color: (widget.foregroundColor == null)
                    ? widget.foregroundColor
                    : Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        );
        return child;
      }).toList()
        ..add(
          FloatingActionButton(
            heroTag: null,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform:
                      Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: Icon(
                    _controller.isDismissed
                        ? (widget.principalIconExpand != null)
                            ? widget.principalIconExpand
                            : Icons.add
                        : (widget.principalIconClose != null)
                            ? widget.principalIconClose
                            : Icons.close,
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
