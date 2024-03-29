import 'package:flutter/material.dart';
import '../../coltrollers/auth_controller.dart';
import '../../coltrollers/cart_controller.dart';
import '../../coltrollers/user_controller.dart';
import '../../pages/account/please_login.dart';
import '../../routes/route_helper.dart';
import '../../utills/colors.dart';
import '../../utills/dimensions.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/custom_loader.dart';
import 'package:get/get.dart';

import '../../coltrollers/location_controller.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find<LocationController>().getAddressList();
    bool userLoggedIn = Get.find<AuthController>().userHaveLoggedIn();
    if (userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
            text: "Delivery Person",
            size: Dimensions.Height20 + 4,
            color: Colors.white),
        elevation: 3,
        centerTitle: true,
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return userLoggedIn
            ? (userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: Dimensions.Height5),
                    child: Column(children: [
                      AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.Height30 * 6,
                          newSize: Dimensions.Width30 * 5),
                      SizedBox(
                        height: Dimensions.Height15,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.person,
                                    backgroundColor: AppColors.mainColor,
                                    iconColor: Colors.white,
                                  ),
                                  bigText: BigText(
                                      text: userController.userModel.name)),
                              SizedBox(
                                height: Dimensions.Height15,
                              ),
                              AccountWidget(
                                  appIcon: const AppIcon(
                                    icon: Icons.phone,
                                    backgroundColor: Colors.greenAccent,
                                    iconColor: Colors.white,
                                  ),
                                  bigText: BigText(
                                      text: userController.userModel.phone)),
                              SizedBox(
                                height: Dimensions.Height15,
                              ),
                              AccountWidget(
                                  appIcon: const AppIcon(
                                    icon: Icons.mail_rounded,
                                    backgroundColor: Colors.blue,
                                    iconColor: Colors.white,
                                  ),
                                  bigText: BigText(
                                      text: userController.userModel.email)),
                              SizedBox(
                                height: Dimensions.Height15,
                              ),
                              AccountWidget(
                                  appIcon: const AppIcon(
                                    icon: Icons.location_pin,
                                    backgroundColor: Colors.blueGrey,
                                    iconColor: Colors.white,
                                  ),
                                  bigText: BigText(text: "Wolkite University,ETH")),
                              SizedBox(
                                height: Dimensions.Height15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (Get.find<AuthController>()
                                      .userHaveLoggedIn()) {
                                    Get.find<AuthController>().clearShareData();
                                    Get.find<CartController>().clear();
                                    Get.find<CartController>()
                                        .clearCartHistory();
                                    Get.offNamed(RouteHelper.getSignIn());
                                  } else {
                                    print("You have logged out");
                                  }
                                },
                                child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.logout_rounded,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                    ),
                                    bigText: BigText(text: "Log Out")),
                              ),
                              SizedBox(
                                height: Dimensions.Height15,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  )
                : const CustomLoader())
            : const PleaseLogin();
      }),
    );
  }
}
