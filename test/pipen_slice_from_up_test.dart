import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pipen/components.dart';

void main() {
  testWidgets('pauses child tickers after the hide transition', (tester) async {
    final show = ValueNotifier(true);
    addTearDown(show.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: ValueListenableBuilder(
          valueListenable: show,
          builder: (context, visible, child) => PipenSliceFromUp(
            show: visible,
            duration: const Duration(milliseconds: 100),
            child: child!,
          ),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.binding.transientCallbackCount, greaterThan(0));

    show.value = false;
    await tester.pump();
    await tester.pumpAndSettle();

    expect(tester.binding.transientCallbackCount, 0);
    expect(tester.binding.hasScheduledFrame, isFalse);

    show.value = true;
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.binding.transientCallbackCount, greaterThan(0));
  });

  testWidgets('supports reversing an active transition', (tester) async {
    final show = ValueNotifier(false);
    addTearDown(show.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: ValueListenableBuilder(
          valueListenable: show,
          builder: (context, visible, child) => PipenSliceFromUp(
            show: visible,
            duration: const Duration(milliseconds: 200),
            child: child!,
          ),
          child: const SizedBox(height: 20),
        ),
      ),
    );

    show.value = true;
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    show.value = false;
    await tester.pump();
    await tester.pumpAndSettle();

    final transition = tester.widget<SizeTransition>(
      find.byType(SizeTransition),
    );
    expect(transition.sizeFactor.value, 0);
  });
}
