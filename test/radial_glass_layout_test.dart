import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

void main() {
  testWidgets('fans radial actions toward the upper-left', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        floatingActionButton: SpeedDialFabWidget(
          layout: SpeedDialLayout.radial,
          radialRadius: 90,
          secondaryIconsList: const [Icons.copy, Icons.paste, Icons.cut],
          secondaryIconsOnPress: [() {}, () {}, () {}],
        ),
      ),
    ));
    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pumpAndSettle();

    final primary = tester.getCenter(find.byIcon(Icons.expand_less));
    final first = tester.getCenter(find.byIcon(Icons.copy));
    expect(first.dx, lessThan(primary.dx));
    expect(first.dy, lessThan(primary.dy));
  });

  testWidgets('glass mode uses translucent backdrop surfaces', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        floatingActionButton: SpeedDialFabWidget(
          glassEffect: true,
          secondaryIconsList: const [Icons.copy],
          secondaryIconsOnPress: [() {}],
        ),
      ),
    ));
    expect(find.byType(BackdropFilter), findsAtLeastNWidgets(1));
  });
}
