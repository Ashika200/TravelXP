import 'package:flutter_test/flutter_test.dart';
import 'package:travel_xp/main.dart'; // Make sure this path is correct

void main() {
  testWidgets('Firebase connection text appears', (WidgetTester tester) async {
    // Build MyApp widget and trigger a frame
    await tester.pumpWidget(MyApp());

    // Check if the title is displayed
    expect(find.text('Firebase Connection'), findsOneWidget);

    // Check if the body text is displayed
    expect(find.text('Firebase is connected!'), findsOneWidget);
  });
}
