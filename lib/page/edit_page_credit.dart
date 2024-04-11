import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scapp_/components/box/credit.dart';
import 'package:scapp_/model/kredi_karti.dart';

class EditPageCredit extends StatefulWidget {
  final KrediKarti krediHesabi;

  const EditPageCredit({required this.krediHesabi, super.key});

  @override
  _EditBankaState createState() => _EditBankaState();
}

class _EditBankaState extends State<EditPageCredit> {
  late TextEditingController _bankaAdiController;
  late TextEditingController _kartNoController;
  late TextEditingController _tarihAyController;
  late TextEditingController _tarihYilController;
  late TextEditingController _guvenlikNoController;

  @override
  void initState() {
    super.initState();
    _bankaAdiController =
        TextEditingController(text: widget.krediHesabi.bankaAdi);
    _kartNoController =
        TextEditingController(text: widget.krediHesabi.kartNo.toString());
    _tarihAyController =
        TextEditingController(text: widget.krediHesabi.tarihAy.toString());
    _tarihYilController =
        TextEditingController(text: widget.krediHesabi.tarihYil.toString());
    _guvenlikNoController =
        TextEditingController(text: widget.krediHesabi.guvenlikNo.toString());
  }

  @override
  void dispose() {
    _bankaAdiController.dispose();
    _kartNoController.dispose();
    _tarihAyController.dispose();
    _tarihYilController.dispose();
    _guvenlikNoController.dispose();
    super.dispose();
  }

  Future<void> update(KrediKarti updatedBankaHesabi) async {
    creditBox = Hive.box<KrediKarti>('creditBox');
    final index = creditBox.keys.cast<int>().toList().indexOf(this.hashCode);

    if (index != -1) {
      creditBox.putAt(index, updatedBankaHesabi);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Kredi kart hesabı'),
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
                final updatedBankaHesabi = KrediKarti(
                  bankaAdi: _bankaAdiController.text,
                  kartNo: int.parse(_kartNoController.text),
                  tarihAy: int.parse(_tarihAyController.text),
                  tarihYil: int.parse(_tarihYilController.text),
                  guvenlikNo: int.parse(_guvenlikNoController.text),
                );

                widget.krediHesabi
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
