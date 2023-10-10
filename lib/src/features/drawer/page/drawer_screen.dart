import 'package:flutter/material.dart';
import 'package:scooter/src/features/shared_widgets/taal_name_and_version.dart';
import 'package:scooter/src/services/storage.dart';
import '../../../constants/strings.dart';
import '../../../constants/styles/taal_styles.dart';
import '../widgets/drawer_options_section.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                    Spaces.horizontalSpaceLarge,
                    Spaces.horizontalSpaceLarge,
                    Text(Strings.profile, style: titleTextStyle),
                  ],
                ),
                Spaces.verticalSpaceSmall,
                ClipOval(
                  child: Image.network(
                    //change this later to the profle pic CDN url
                    Storage.instance.profileImage ??
                        'https://picsum.photos/200',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                Spaces.verticalSpaceSmall,
                Text(Storage.instance.profileName ?? 'میلاد سعیدی'),
                Spaces.verticalSpaceTiny,
                Text(Storage.instance.phoneNumber ?? '۰۹۱۲۳۴۵۶۷۸۹'),
                Spaces.verticalSpaceMedium,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Strings.categories,
                    style: titleTextStyle,
                  ),
                ),
                Spaces.verticalSpaceSmall,
                const DrawerOptionsSection(),
                const TaalNameAndVersion()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
