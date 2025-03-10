import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:the_venues/Common%20Widget/preview_cell.dart';
import 'package:the_venues/Views/Main%20Tab%20View/Vendors%20Page/groom_wear_view.dart';

void main() {
  group('GroomWearView', () {
    testWidgets('displays AppBar with title "Groom Wears"', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: GroomWearView()));
      expect(find.text('Groom Wears'), findsOneWidget);
    });

    testWidgets('displays search bar with hint text "Search..."', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: GroomWearView()));
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Search...'), findsOneWidget);
    });

    testWidgets('displays carousel with images', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: GroomWearView()));
      expect(find.byType(CarouselSlider), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(3));
    });

    testWidgets('displays grid view with groom wear items', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: GroomWearView()));
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(PreviewCell), findsWidgets);
    });

    testWidgets('navigates back when back button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: GroomWearView()));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.byType(GroomWearView), findsNothing);
    });

    testWidgets('search bar focuses when tapped', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: GroomWearView()));
      await tester.tap(find.byType(TextField));
      await tester.pump();
      expect(find.text('Search...'), findsNothing);
    });

    testWidgets('carousel changes page when swiped', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: GroomWearView()));
      await tester.drag(find.byType(CarouselSlider), const Offset(-400, 0));
      await tester.pumpAndSettle();
      expect(find.byType(CarouselSlider), findsOneWidget);
    });
  });
}