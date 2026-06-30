import 'package:bitflame/app/pixelhain_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app starts at Pixelhain game screen', (tester) async {
    await tester.pumpWidget(const PixelhainApp());
    expect(find.text('Der Pixelhain'), findsOneWidget);
    expect(find.text('Puzzle 1 – Grundpuls'), findsOneWidget);
  });
}
