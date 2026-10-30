import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigasi_wisata/main.dart';

void main() {
  testWidgets('Pengujian navigasi aplikasi Wisata Indonesia',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // 1. Verifikasi halaman beranda dan 4 menu utama
    expect(find.text('Wisata Indonesia'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.text('Pantai'), findsOneWidget);
    expect(find.text('Gunung'), findsOneWidget);
    expect(find.text('Budaya'), findsOneWidget);
    expect(find.text('Kuliner'), findsOneWidget);

    // 2. Navigasi ke halaman Pantai
    await tester.tap(find.text('Pantai'));
    await tester.pumpAndSettle();

    expect(find.text('Pantai Kuta'), findsOneWidget);
    expect(find.text('Lihat Detail'), findsOneWidget);
    expect(find.text('Kembali'), findsOneWidget);

    // 3. Navigasi ke halaman Detail Wisata dengan parameter nama tempat wisata
    await tester.tap(find.text('Lihat Detail'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Wisata'), findsOneWidget);
    expect(find.text('Pantai Kuta'), findsOneWidget);

    // 4. Kembali dari Detail Wisata ke halaman Pantai
    await tester.tap(find.text('Kembali'));
    await tester.pumpAndSettle();
    expect(find.text('Lihat Detail'), findsOneWidget);

    // 5. Kembali dari halaman Pantai ke Beranda
    await tester.tap(find.text('Kembali'));
    await tester.pumpAndSettle();
    expect(find.text('Wisata Indonesia'), findsOneWidget);
  });
}
