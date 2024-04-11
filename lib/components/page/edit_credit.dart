import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:scapp_/components/box/credit.dart';

import '../../model/kredi_karti.dart';

class EditCredit extends StatefulWidget {
  const EditCredit({super.key});

  @override
  State<EditCredit> createState() => _EditBankaState();
}

class _EditBankaState extends State<EditCredit> {
  @override
  Widget build(BuildContext context) {
    String bankaAdi = 'Banka';
    int kartNo = 0;
    int tarihAy = 0;
    int tarihYil = 0;
    int guvenlikNo = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade200,
        title: const Text(
          'Kredi kart hesabı +',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              onChanged: (value) => bankaAdi = value,
              decoration: const InputDecoration(labelText: 'Banka Adı'),
            ),
            TextField(
              onChanged: (value) => kartNo = int.parse(value),
              decoration: const InputDecoration(labelText: 'Kart No'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              onChanged: (value) => tarihAy = int.parse(value),
              decoration: const InputDecoration(labelText: 'Tarih Ay'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              onChanged: (value) => tarihYil = int.parse(value),
              decoration: const InputDecoration(labelText: 'Tarih Yıl'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              onChanged: (value) => guvenlikNo = int.parse(value),
              decoration: const InputDecoration(labelText: 'Güvenlik No'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var bankaHesabi = KrediKarti(
                  bankaAdi: bankaAdi,
                  kartNo: kartNo,
                  tarihAy: tarihAy,
                  tarihYil: tarihYil,
                  guvenlikNo: guvenlikNo,
                );
                setState(() {});

                if (!Hive.isBoxOpen('creditBox')) {
                  await Hive.openBox<KrediKarti>('creditBox');
                }
                setState(() {});

                creditBox = Hive.box('creditBox');
                await creditBox.add(bankaHesabi);

                Navigator.pop(context);
                setState(() {});
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
