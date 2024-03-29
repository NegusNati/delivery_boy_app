import 'package:delivery_boy_app/coltrollers/order_controller.dart';
import 'package:delivery_boy_app/utills/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/helper/dependencies.dart' as dependencies;
import 'coltrollers/cart_controller.dart';
import 'coltrollers/recomended_products_controller.dart';
import 'models/popular_model.dart';
import 'routes/route_helper.dart';

// Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async{
//   print("onBackground: ${message.notification?.title}/${message.notification?.body}/""${message.notification?.titleLocKey}");
// }
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  // to ensure the dependencies are first initalized
  WidgetsFlutterBinding.ensureInitialized();
  // initalize the dependencies
  await dependencies.init();

  //run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ProductModal product = ProductModal();
    //   Get.find<BeverageController>()
    //     .initProduct(Get.find<CartController>(), product);
    // Get.find<PopularProductController>()
    //     .initProduct(Get.find<CartController>(), product);

    Get.find<CartController>().getCartData();
    // Get.find<PopularProductController>()
    //     .initProduct(Get.find<CartController>(), );
    return GetBuilder<OrderController>(builder: (_) {
      return GetBuilder<RecomendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: AppColors.mainColor,
            primarySwatch: Colors.blue,
          ),
          // home: OrderPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
