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
  testWidgets('animation category filters the film list',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('Անիմացիա'));
      await tester.pumpAndSettle();

      expect(find.text('4 ֆիլմ'), findsOneWidget);
      expect(find.text('Spirited Away'), findsOneWidget);
      expect(find.text('Coco'), findsOneWidget);
      expect(find.text('Interstellar'), findsNothing);
    });
  });

  testWidgets('bottom navigation switches between films and favorites',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Interstellar'), findsOneWidget);
      await tester.tap(find.text('Սիրվածներ'));
      await tester.pumpAndSettle();
      expect(find.text('Ֆիլմեր չեն գտնվել'), findsOneWidget);

      await tester.tap(find.text('Գլխավոր'));
      await tester.pumpAndSettle();
      expect(find.text('Interstellar'), findsOneWidget);
    });
  });

  testWidgets('profile navigation opens the profile page',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('Պրոֆիլ'));
      await tester.pumpAndSettle();

      expect(find.text('Իմ պրոֆիլը'), findsWidgets);
      expect(find.text('Ֆիլմասեր'), findsOneWidget);
      expect(find.text('Սիրվածներ'), findsWidgets);
    });
  });

  testWidgets('tapping a film opens its details and trailer page',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MyApp());

      final filmTitle = find.text('Interstellar').first;
      await tester.ensureVisible(filmTitle);
      await tester.pumpAndSettle();
      await tester.tap(filmTitle);
      await tester.pumpAndSettle();

      expect(find.text('Ֆիլմի մասին'), findsOneWidget);
      expect(find.textContaining('որդնանցքով'), findsOneWidget);
      expect(find.text('Դերասանական կազմ'), findsOneWidget);
      expect(find.text('Matthew McConaughey'), findsOneWidget);
      expect(find.text('+ Ցուցակ'), findsOneWidget);
      expect(find.text('Դիտել ֆիլմը'), findsOneWidget);

      await tester.ensureVisible(find.text('+ Ցուցակ'));
      await tester.tap(find.text('+ Ցուցակ'));
      await tester.pumpAndSettle();
      expect(find.text('Ցուցակում է'), findsOneWidget);

      await tester.ensureVisible(find.text('Դիտել ֆիլմը'));
      await tester.tap(find.text('Դիտել ֆիլմը'));
      await tester.pumpAndSettle();
      expect(find.textContaining('ֆիլմի համար'), findsOneWidget);

      await tester.pageBack();
      await tester.pumpAndSettle();
      await tester.pageBack();
      await tester.pumpAndSettle();
      await tester.tap(find.text('Սիրվածներ'));
      await tester.pumpAndSettle();
      expect(find.text('Interstellar'), findsOneWidget);
    });
  });
}
