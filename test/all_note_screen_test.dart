// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/homepage.dart';

void main() {
  testWidgets('Home page test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(HomePage());

    expect(find.widgetWithIcon(BottomNavigationBarItem, Icons.home),
        findsOneWidget);
    expect(find.widgetWithIcon(BottomNavigationBarItem, Icons.wb_sunny),
        findsOneWidget);
    expect(
        find.widgetWithIcon(BottomNavigationBarItem, Icons.wb_sunny_outlined),
        findsOneWidget);
    final appBar = find.byElementType(AppBar);
    expect(appBar, findsOneWidget);
  });
}
