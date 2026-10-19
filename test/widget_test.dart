import 'package:flutter_test/flutter_test.dart';
import 'package:app3/main.dart';

void main() {
  testWidgets('MiniShop uygulaması açılır', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniShopApp());

    expect(find.text('MiniShop'), findsOneWidget);
    expect(
      find.text('MiniShop uygulamamıza hoş geldin!'),
      findsOneWidget,
    );
  });
}