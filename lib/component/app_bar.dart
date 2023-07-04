import 'package:flutter/material.dart';

class CostomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CostomAppBar({super.key, required this.scaffoldKey});

  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Center(
        child: Text(
          'デザイン',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      leading: IconButton(
        color: Colors.black,
        iconSize: 40,
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
        icon: const Icon(Icons.supervised_user_circle_rounded),
      ),
      actions: <Widget>[
        Row(
          children: [
            Text(
              DateTime.now().toString(),
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ],
    );
  }
}
