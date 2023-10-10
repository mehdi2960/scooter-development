import 'package:flutter/material.dart';

import '../../constants/styles/taal_styles.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({
    super.key,
    this.title,
    this.centerTitle,
  });
  final String? title;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      title: Text(
        title ?? '',
        style: titleTextStyle,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
