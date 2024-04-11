

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scapp_/components/box/credit.dart';
import 'package:scapp_/model/kredi_karti.dart';
import 'package:scapp_/page/edit_page_credit.dart';

class KrediPage extends StatefulWidget {
  const KrediPage({super.key});

  @override
  _BankaPageState createState() => _BankaPageState();
}

class _BankaPageState extends State<KrediPage> {

  @override
  void initState() {
    super.initState();
    _openBox();
    _listenToBoxChanges();
  }

  

  _openBox() async {
    creditBox = await Hive.openBox<KrediKarti>('creditBox');
  }

  _listenToBoxChanges() {
    creditBox.watch().listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (creditBox.isEmpty) {
      return const Center(
        child: Text('Kredi Kartı verisi bulunamadı.'),
      );
    }

    return ListView.builder(
      itemCount: creditBox.length,
      itemBuilder: (context, index) {
        var creditHesabi = creditBox.getAt(index)!;
        return ListTile(
          onTap: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                             EditPageCredit(krediHesabi: creditHesabi,),
                      ),
                    );
          },
          leading: CircleAvatar(child: Text((index + 1).toString())),
          title: Text(creditHesabi.bankaAdi),
          /* subtitle: Text('IBAN: TR${creditHesabi.}'), */
          trailing: IconButton(
              onPressed: () async {
                await creditBox.deleteAt(index);
                setState(() {});
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 24,
              )),
        );
      },
    );
  }
}
