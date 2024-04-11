import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scapp_/components/box/banka.dart';

import '../model/banka_hesabi.dart';

class EditBanka extends StatefulWidget {
  final BankaHesabi bankaHesabi;

  const EditBanka({required this.bankaHesabi, super.key});

  @override
  _EditBankaState createState() => _EditBankaState();
}

class _EditBankaState extends State<EditBanka> {
  late TextEditingController _bankaAdiController;
  late TextEditingController _ibanController;
  late TextEditingController _kartNoController;
  late TextEditingController _tarihAyController;
  late TextEditingController _tarihYilController;
  late TextEditingController _guvenlikNoController;

  @override
  void initState() {
    super.initState();
    _bankaAdiController =
        TextEditingController(text: widget.bankaHesabi.bankaAdi);
    _ibanController =
        TextEditingController(text: widget.bankaHesabi.iban.toString());
    _kartNoController =
        TextEditingController(text: widget.bankaHesabi.kartNo.toString());
    _tarihAyController =
        TextEditingController(text: widget.bankaHesabi.tarihAy.toString());
    _tarihYilController =
        TextEditingController(text: widget.bankaHesabi.tarihYil.toString());
    _guvenlikNoController =
        TextEditingController(text: widget.bankaHesabi.guvenlikNo.toString());
  }

  @override
  void dispose() {
    _bankaAdiController.dispose();
    _ibanController.dispose();
    _kartNoController.dispose();
    _tarihAyController.dispose();
    _tarihYilController.dispose();
    _guvenlikNoController.dispose();
    super.dispose();
  }

  Future<void> update(BankaHesabi updatedBankaHesabi) async {
    bankaBox = Hive.box<BankaHesabi>('bankaBox');
    final index = bankaBox.keys.cast<int>().toList().indexOf(this.hashCode);

    if (index != -1) {
      bankaBox.putAt(index, updatedBankaHesabi);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Banka Hesabı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _bankaAdiController,
              decoration: const InputDecoration(labelText: 'Banka Adı'),
            ),
            TextField(
              controller: _ibanController,
              decoration: const InputDecoration(labelText: 'IBAN'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _kartNoController,
              decoration: const InputDecoration(labelText: 'Kart No'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _tarihAyController,
              decoration: const InputDecoration(labelText: 'Tarih Ay'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _tarihYilController,
              decoration: const InputDecoration(labelText: 'Tarih Yıl'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _guvenlikNoController,
              decoration: const InputDecoration(labelText: 'Güvenlik No'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedBankaHesabi = BankaHesabi(
                  bankaAdi: _bankaAdiController.text,
                  iban: int.parse(_ibanController.text),
                  kartNo: int.parse(_kartNoController.text),
                  tarihAy: int.parse(_tarihAyController.text),
                  tarihYil: int.parse(_tarihYilController.text),
                  guvenlikNo: int.parse(_guvenlikNoController.text),
                );

                widget.bankaHesabi
                    .update(updatedBankaHesabi); // Hive'da güncelleme
                Navigator.pop(context); // Sayfayı kapat
              },
              child: const Text('Güncelle'),
            ),
          ],
        ),
      ),
    );
  }
}
