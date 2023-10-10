import 'package:flutter/material.dart';
import 'package:scooter/src/constants/styles/taal_styles.dart';
import 'package:scooter/src/features/shared_widgets/svg_box.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.image,
    required this.title,
    this.isSvg = true,
    this.isCenter = false,
    this.description,
  });

  final String image;
  final String title;
  final String? description;
  final bool isSvg;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Flexible(
          flex: 3,
          child: Center(
            child: SizedBox.square(
              dimension: width * 0.9,
              child: isSvg
                  ? Container(
                      color: Colors.amber,
                      child: SvgBox(
                        assetName: image,
                      ),
                    )
                  : Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            subtitle: Text(
              description ?? '',
              textAlign: isCenter ? TextAlign.center : TextAlign.right,
              style: onBoardingDescriptionTextStyle,
            ),
            dense: false,
            minVerticalPadding: 10,
            title: Text(
              title,
              style: headerTextStyle,
              textAlign: isCenter ? TextAlign.center : TextAlign.right,
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.onBoardingConatinerColor,
                    borderRadius: BorderRadius.circular(Sizes.s),
                  ),
                  child: SizedBox.square(
                    dimension: width * 0.65,
                    child: isSvg
                        ? Container(
                            color: Colors.amber,
                            child: SvgBox(
                              assetName: image,
                            ),
                          )
                        : Image.asset(
                            image,
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
                Spaces.verticalSpaceLarge,
                Text(
                  title,
                  style: headerTextStyle,
                  textAlign: TextAlign.center,
                ),
                Spaces.verticalSpaceSemiMedium,
                Text(
                  description ?? '',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: onBoardingDescriptionTextStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class HowToRidePageViewItem extends StatelessWidget {
//   const HowToRidePageViewItem(
//       {super.key,
//       required this.image,
//       required this.title,
//       required this.subTitle});

//   final String image;
//   final String title;
//   final String subTitle;

//   @override
//   Widget build(BuildContext context) {
//      final double width = MediaQuery.of(context).size.width;
//     return Column(
//       children: <Widget>[
//         Flexible(
//           flex: 6,
//           child: Center(
//             child: SizedBox.square(
//                 dimension: width * 0.9,
//                 child: isSvg
//                     ? SvgBox(
//                         assetName: image,
//                       )
//                     : Image.asset(image)),
//           ),
//         ),
//         // Text(
//         //   title,
//         //   style: headerTextStyle,
//         // ),
//         // Text(
//         //   description ?? '',
//         //   style: onBoardingDescriptionTextStyle,
//         // ),

//         Flexible(
//           child: ListTile(
//             subtitle: Text(
//               description ?? "",
//               textAlign: TextAlign.right,
//               style: onBoardingDescriptionTextStyle,
//             ),
//             dense: false,
//             minVerticalPadding: 10,
//             title: Text(
//               title,
//               style: headerTextStyle,
//               textAlign: TextAlign.right,
//             ),
//           ),
//         ),
//       ],
//     );
  
// }
