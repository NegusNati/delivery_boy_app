import 'package:flutter/material.dart';
import '../../utills/colors.dart';
import '../../utills/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/small_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class PleaseLogin extends StatelessWidget {
  const PleaseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.Width5 * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SmallText(
            text:
                "You have not signed in sir, please Signin to access your Order status and history. ",
            color: AppColors.paraColor,
          )),
          SizedBox(
            height: Dimensions.Height15,
          ),
          CustomButton(
            buttonText: " Sign-In",
            icon: Icons.login,
            onPressed: () => Get.toNamed(RouteHelper.getSignIn()),
          ),
        ],
      ),
    );
  }
}
