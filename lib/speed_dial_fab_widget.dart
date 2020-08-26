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
  State createState() => new SpeedDialFabWidgetState();
}

class SpeedDialFabWidgetState extends State<SpeedDialFabWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: new List.generate(widget.secondaryIconsList.length,
          (int index) {
        Widget child = new Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: new ScaleTransition(
            scale: new CurvedAnimation(
              parent: _controller,
              curve: new Interval(
                  0.0, 1.0 - index / widget.secondaryIconsList.length / 2.0,
                  curve: Curves.easeOut),
            ),
            child: new FloatingActionButton(
              tooltip: widget.secondaryIconsTooltip[index],
              heroTag: null,
              backgroundColor: (widget.backgroundColor == null)
                  ? widget.backgroundColor
                  : Colors.white,
              mini: true,
              child: new Icon(
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
          new FloatingActionButton(
            heroTag: null,
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform:
                      new Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: new Icon(
                    _controller.isDismissed
                        ? (widget.principalIconExpand != null)
                            ? widget.principalIconExpand
                            : Icons.more_vert
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
