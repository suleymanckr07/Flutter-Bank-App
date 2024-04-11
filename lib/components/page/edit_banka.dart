import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:scapp_/components/box/banka.dart';

import '../../model/banka_hesabi.dart';

class EditBanka extends StatefulWidget {
  const EditBanka({super.key});

  @override
  State<EditBanka> createState() => _EditBankaState();
}

class _EditBankaState extends State<EditBanka> {
  @override
  Widget build(BuildContext context) {
    String bankaAdi = 'Banka';
    int iban = 0;
    int kartNo = 0;
    int tarihAy = 0;
    int tarihYil = 0;
    int guvenlikNo = 0;

    final formKey = GlobalKey<FormState>();
    final TextEditingController bankaAdiController = TextEditingController();
    final TextEditingController ibanController = TextEditingController();
    final TextEditingController kartNoController = TextEditingController();
    final TextEditingController tarihAyController = TextEditingController();
    final TextEditingController tarihYilController = TextEditingController();
    final TextEditingController guvenlikNoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade200,
        title: const Text(
          'Banka hesabı +',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextField(
                controller: bankaAdiController,
                keyboardType: TextInputType.name,
                autofocus: true,
                onChanged: (value) => bankaAdi = value,
                decoration: const InputDecoration(labelText: 'Banka Adı'),
              ),
              TextField(
                controller: ibanController,
                maxLength: 26,
                onChanged: (value) => iban = int.parse(value),
                decoration: const InputDecoration(labelText: 'IBAN'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: kartNoController,
                maxLength: 16,
                onChanged: (value) => kartNo = int.parse(value),
                decoration: const InputDecoration(labelText: 'Kart No'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: tarihAyController,
                maxLength: 2,
                onChanged: (value) => tarihAy = int.parse(value),
                decoration: const InputDecoration(labelText: 'Tarih Ay'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: tarihYilController,
                maxLength: 2,
                onChanged: (value) => tarihYil = int.parse(value),
                decoration: const InputDecoration(labelText: 'Tarih Yıl'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: guvenlikNoController,
                maxLength: 3,
                onChanged: (value) => guvenlikNo = int.parse(value),
                decoration: const InputDecoration(labelText: 'Güvenlik No'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  var bankaHesabi = BankaHesabi(
                    bankaAdi: bankaAdi,
                    iban: iban,
                    kartNo: kartNo,
                    tarihAy: tarihAy,
                    tarihYil: tarihYil,
                    guvenlikNo: guvenlikNo,
                  );
                  

                  if (!Hive.isBoxOpen('bankaBox')) {
                    await Hive.openBox<BankaHesabi>('bankaBox');
                  }
                  setState(() {});

                  bankaBox = Hive.box('bankaBox');
                  await bankaBox.add(bankaHesabi);

                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
