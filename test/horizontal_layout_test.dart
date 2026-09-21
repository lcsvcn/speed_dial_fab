import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

void main() {
  testWidgets('lays out actions horizontally', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(
      floatingActionButton: SpeedDialFabWidget(
        direction: SpeedDialDirection.left,
        secondaryIconsList: const [Icons.copy, Icons.paste],
        secondaryIconsOnPress: [() {}, () {}],
      ),
    )));
    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pumpAndSettle();
    final copy = tester.getCenter(find.byIcon(Icons.copy));
    final paste = tester.getCenter(find.byIcon(Icons.paste));
    expect(copy.dy, closeTo(paste.dy, 1));
    expect(copy.dx, isNot(closeTo(paste.dx, 1)));
  });
}
