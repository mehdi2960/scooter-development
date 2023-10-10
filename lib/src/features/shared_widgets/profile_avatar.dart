import 'package:flutter/material.dart';
import 'package:scooter/src/constants/assets.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          height: 72,
          width: 72,
          child: Image.asset(
            Assets.editProfile,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: GestureDetector(
            onTap: () {},
            child: const SvgBox(assetName: Assets.cameraUserInfo),
          ),
        )
      ],
    );
  }
}
