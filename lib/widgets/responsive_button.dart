import 'package:flutter/cupertino.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/widgets/app_large_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          // mainAxisAlignment: isResponsive == true
          //     ? MainAxisAlignment.spaceBetween
          //     : MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // isResponsive == true
            //     ? Container(
            //         margin: const EdgeInsets.only(left: 20),
            //         child: AppLargeText(text: "Đặt Tour Ngay...", size: 15))
            //     : Container()
            AppLargeText(text: "Đặt Tour Ngay...", size: 14),
            // Image.asset("img/button-one.png"),
          ],
        ),
      ),
    );
  }
}
