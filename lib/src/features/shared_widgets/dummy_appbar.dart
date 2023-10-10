import 'package:flutter/material.dart';

class DummyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DummyAppBar({
    super.key,
    this.backgroundColor,
  });

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
