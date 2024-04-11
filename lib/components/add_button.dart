import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:scapp_/components/popup_list.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          showPopover(
            backgroundColor: Colors.deepPurple.shade100,
            height: 100,
            width: 150,
            direction: PopoverDirection.top,
            context: context,
            bodyBuilder: (context) {
              return const PopupList();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
