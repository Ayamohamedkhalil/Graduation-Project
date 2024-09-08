import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    super.key,
    this.height = 58,
    this.ratioOfContainerWidth = 0.7,
    this.ratioOfStartAndEndPadding = 0.1,
    this.iconSize = 37,
    this.backGroundColor = const Color(0xffC4D3C7),
    this.iconColor = const Color(0xff3B5D44),
  });

  final double height;
  final double ratioOfContainerWidth;
  final double ratioOfStartAndEndPadding;
  final double iconSize;
  final Color backGroundColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: MediaQuery.of(context).size.width.w * ratioOfContainerWidth,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: ThirdColor),
        color: backGroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SizedBox(
        height: height.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width.w *
                  ratioOfStartAndEndPadding,
            ),
            Expanded(
              child: IconButton(
                color: iconColor,
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  size: iconSize.sp,
                ),
              ),
            ),
            // FaIcon(FontAwesomeIcons.pen),
            Expanded(
              child: IconButton(
                color: const Color(0xff3B5D44),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const homescreen()),
                  );
                },
                icon: Icon(
                  Icons.home,
                  size: iconSize.sp,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                color: const Color(0xff3B5D44),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfile()),
                  );
                },
                icon: Icon(
                  Icons.person,
                  size: iconSize.sp,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width.w *
                  ratioOfStartAndEndPadding,
            ),
          ],
        ),
      ),
    );
  }
}
