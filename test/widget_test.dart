// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:group_project/main.dart';

void main() {
  testWidgets('tapping a film opens its details and trailer page',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MyApp());

      final filmTitle = find.text('Interstellar').first;
      await tester.ensureVisible(filmTitle);
      await tester.pumpAndSettle();
      await tester.tap(filmTitle);
      await tester.pumpAndSettle();

      expect(find.text('About this film'), findsOneWidget);
      expect(find.textContaining('wormhole'), findsOneWidget);
      expect(find.text('Cast'), findsOneWidget);
      expect(find.text('Matthew McConaughey'), findsOneWidget);
      expect(find.text('Watch trailer on YouTube'), findsOneWidget);
    });
  });
}
