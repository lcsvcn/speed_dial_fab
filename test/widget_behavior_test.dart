import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

Widget _app(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: const SizedBox.expand(),
      floatingActionButton: child,
    ),
  );
}

void main() {
  testWidgets('invokes an action and starts collapsing the dial', (tester) async {
    var pressed = false;
    await tester.pumpWidget(
      _app(
        SpeedDialFabWidget(
          secondaryIconsList: const [Icons.copy],
          secondaryIconsOnPress: [() => pressed = true],
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.copy));
    await tester.pump();

    expect(pressed, isTrue);
  });

  testWidgets('supports labels for secondary actions', (tester) async {
    await tester.pumpWidget(
      _app(
        SpeedDialFabWidget(
          secondaryIconsList: const [Icons.copy, Icons.share],
          secondaryIconsOnPress: [() {}, () {}],
          secondaryIconsText: const ['Copy', 'Share'],
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pumpAndSettle();

    expect(find.text('Copy'), findsOneWidget);
    expect(find.text('Share'), findsOneWidget);
  });

  testWidgets('places actions below the primary button', (tester) async {
    await tester.pumpWidget(
      _app(
        SpeedDialFabWidget(
          direction: SpeedDialDirection.down,
          secondaryIconsList: const [Icons.copy],
          secondaryIconsOnPress: [() {}],
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pumpAndSettle();

    final primary = tester.getCenter(find.byIcon(Icons.expand_less));
    final action = tester.getCenter(find.byIcon(Icons.copy));
    expect(action.dy, greaterThan(primary.dy));
  });

  testWidgets('places actions to the right for the legacy direction API',
      (tester) async {
    await tester.pumpWidget(
      _app(
        SpeedDialFabWidget(
          direction: SpeedDialDirection.right,
          secondaryIconsList: const [Icons.copy],
          secondaryIconsOnPress: [() {}],
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pumpAndSettle();

    final primary = tester.getCenter(find.byIcon(Icons.expand_less));
    final action = tester.getCenter(find.byIcon(Icons.copy));
    expect(action.dx, greaterThan(primary.dx));
  });

  testWidgets('removes the optional background blur after collapsing',
      (tester) async {
    await tester.pumpWidget(
      _app(
        SpeedDialFabWidget(
          blurBackground: true,
          secondaryIconsList: const [Icons.copy],
          secondaryIconsOnPress: [() {}],
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pump();
    expect(find.byType(BackdropFilter), findsOneWidget);

    await tester.tap(find.byIcon(Icons.expand_less));
    await tester.pumpAndSettle();
    expect(find.byType(BackdropFilter), findsNothing);
  });

  testWidgets('glass mode applies a backdrop filter to the primary action',
      (tester) async {
    await tester.pumpWidget(
      _app(
        SpeedDialFabWidget(
          glassEffect: true,
          glassBlurSigma: 20,
          secondaryIconsList: const [Icons.copy],
          secondaryIconsOnPress: [() {}],
        ),
      ),
    );

    expect(find.byType(BackdropFilter), findsOneWidget);
  });

  testWidgets('rejects mismatched action and callback lists', (tester) async {
    expect(
      () => SpeedDialFabWidget(
        secondaryIconsList: const [Icons.copy],
        secondaryIconsOnPress: const [],
      ),
      throwsA(isA<AssertionError>()),
    );
  });
}
