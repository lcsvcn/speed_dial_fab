import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

void main() {
  testWidgets('expands using a custom animation duration', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(
      floatingActionButton: SpeedDialFabWidget(
        animationDuration: const Duration(milliseconds: 100),
        secondaryIconsList: const [Icons.copy],
        secondaryIconsOnPress: [() {}],
      ),
    )));
    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pump(const Duration(milliseconds: 50));
    expect(find.byIcon(Icons.copy), findsOneWidget);
  });
}
