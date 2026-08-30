import 'package:flutter_test/flutter_test.dart';

import 'package:rbcom/main.dart';

void main() {
  testWidgets('RBCOM inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const RBCOMApp());

    expect(find.text('RBCOM'), findsWidgets);
    expect(find.text('Radioamadorismo conectado'), findsOneWidget);
    expect(find.text('CQER Digital'), findsOneWidget);
    expect(find.text('Faixas de Radiofrequência'), findsOneWidget);
  });
}