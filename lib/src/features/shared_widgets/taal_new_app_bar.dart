import 'package:flutter/material.dart';
import '../../constants/styles/taal_styles.dart';

class TaalNewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaalNewAppBar(
      {super.key,
      this.title,
      this.isCenterTitle = true,
      this.iconWidgetRight = const Icon(Icons.arrow_forward_ios),
      this.iconWidgetLeft,
      this.arrowOnPress,
      this.forwardOnPress});

  final String? title;
  final bool? isCenterTitle;
  final Widget? iconWidgetRight;
  final Widget? iconWidgetLeft;
  final void Function()? arrowOnPress;
  final void Function()? forwardOnPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: isCenterTitle ?? false,
      title: Text(
        title ?? '',
        style: titleTextStyle,
      ),
      actions: <Widget>[
        IconButton(
            onPressed: forwardOnPress
            // () {
            //   Navigator.pop(context);
            // }
            ,
            icon: iconWidgetRight!),
      ],
      backgroundColor: AppColors.primaryWhite,
      leading: InkWell(onTap: arrowOnPress, child: iconWidgetLeft),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
