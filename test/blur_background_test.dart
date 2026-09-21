import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

void main() {
  testWidgets('shows a background blur when expanded', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(
      floatingActionButton: SpeedDialFabWidget(
        blurBackground: true,
        blurBackgroundSigma: 8,
        secondaryIconsList: const [Icons.copy],
        secondaryIconsOnPress: [() {}],
      ),
    )));
    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pump();
    final filter = tester.widget<BackdropFilter>(find.byType(BackdropFilter));
    expect(filter.filter, isA<ImageFilter>());
  });
}
