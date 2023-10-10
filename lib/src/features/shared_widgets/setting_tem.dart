import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/sizes.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
  });
  final String title;
  final String leadingIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: Sizes.ss),
          color: Colors.grey[30],
          child: ListTile(
            onTap: onTap,
            contentPadding: EdgeInsets.zero,
            leading: SvgBox(assetName: leadingIcon),
            trailing: const Icon(Icons.chevron_right),
            title: Text(
              title,
            ),
          ),
        ),
        // const Divider()
      ],
    );
  }
}
