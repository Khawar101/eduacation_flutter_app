import 'package:flutter/material.dart';

import '../../../../widgets/app_utils.dart';

enum SampleItem { itemOne, itemTwo }

class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      // padding: const EdgeInsets.all(0),
      iconSize: 15, position: PopupMenuPosition.over,
      initialValue: selectedMenu,

      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
            //  padding: EdgeInsets.all(0),
            value: SampleItem.itemOne,
            child: SmallText(text: "Delete", color: Colors.red)),
        const PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            // padding: EdgeInsets.all(0),
            child: SmallText(text: "Edit", color: Colors.black)),
      ],
    );
  }
}
