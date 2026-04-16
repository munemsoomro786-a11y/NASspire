import 'package:flutter_test/flutter_test.dart';
import 'package:nasspire/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: NASspireApp()));

    // Verify that our app builds successfully and contains the NASspire title text somewhere.
    expect(find.text('NASspire'), findsWidgets);
  });
}
