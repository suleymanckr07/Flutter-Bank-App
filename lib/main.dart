import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scapp_/components/box/banka.dart';
import 'package:scapp_/components/box/credit.dart';
import 'package:scapp_/page/home_page.dart';

import 'model/banka_hesabi.dart';
import 'model/kredi_karti.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BankaHesabiAdapter());
  bankaBox = await Hive.openBox('bankaBox');
  Hive.registerAdapter(KrediKartiAdapter());
  creditBox = await Hive.openBox('creditBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
