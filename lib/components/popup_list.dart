import 'package:flutter/material.dart';
import 'package:scapp_/components/page/edit_banka.dart';
import 'package:scapp_/components/page/edit_credit.dart';

class PopupList extends StatelessWidget {
  const PopupList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Popup list
        Container(
          height: 50,
          color: Colors.deepPurple.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.credit_card),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const EditBanka(),
                      ),
                    );
                  },
                  child: const Text("Banka Hesabı")),
            ],
          ),
        ),
        // 2. Popup list
        Container(
          height: 50,
          color: Colors.deepPurple.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.credit_card),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const EditCredit(),
                      ),
                    );
                  },
                  child: const Text("Kredi Hesabı")),
            ],
          ),
        ),
      ],
    );
  }
}
