import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scapp_/components/box/banka.dart';
import 'package:scapp_/page/edit_page_banka.dart';
import '../model/banka_hesabi.dart';

class BankaPage extends StatefulWidget {
  const BankaPage({super.key});

  @override
  _BankaPageState createState() => _BankaPageState();
}

class _BankaPageState extends State<BankaPage> {
  @override
  void initState() {
    super.initState();
    _openBox();
    _listenToBoxChanges();
  }

  _openBox() async {
    bankaBox = await Hive.openBox<BankaHesabi>('bankaBox');
  }

  _listenToBoxChanges() {
    bankaBox.watch().listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (bankaBox.isEmpty) {
      return const Center(
        child: Text('Banka verisi bulunamadı.'),
      );
    }

    return ListView.builder(
      itemCount: bankaBox.length,
      itemBuilder: (context, index) {
        var bankaHesabi = bankaBox.getAt(index)!;
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => EditBanka(
                  bankaHesabi: bankaHesabi,
                ),
              ),
            );
          },
          leading: CircleAvatar(child: Text((index + 1).toString())),
          title: Text(bankaHesabi.bankaAdi),
          subtitle: Text('IBAN: TR${bankaHesabi.iban.toString()}'),
          trailing: IconButton(
              onPressed: () async {
                await bankaBox.deleteAt(index);
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
