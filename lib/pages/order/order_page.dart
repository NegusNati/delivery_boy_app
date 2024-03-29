import 'package:flutter/material.dart';
import '../../coltrollers/auth_controller.dart';
import '../../coltrollers/order_controller.dart';
import '../../pages/order/view_order.dart';
import '../../utills/colors.dart';
import '../../utills/dimensions.dart';
import 'package:get/get.dart';

import '../account/please_login.dart';



class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool _isLoggedIn;
  Future<void> _loadResource() async {
    if (_isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  void initState() {
    super.initState();
          // Get.find<OrderController>().getOrderList();
    _isLoggedIn = Get.find<AuthController>().userHaveLoggedIn();
    if (_isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    } else {
      
    }
  }


  @override
  Widget build(BuildContext context) {
          // Get.find<OrderController>().getOrderList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Orders"),
        backgroundColor: AppColors.mainColor,
      ),
      body: _isLoggedIn
          ? Column(
              children: [
                SizedBox(
                  width: Dimensions.screenWidth,
                  child: TabBar(
                    indicatorColor: Theme.of(context).primaryColor,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Theme.of(context).disabledColor,
                    indicatorWeight: 3,
                    tabs: const [
                      Tab(
                        text: "Current Orders",
                      ),
                      Tab(
                        text: "Delivered Orders",
                      ),
                    ],
                    controller: _tabController,
                  ),
                ),
                Expanded(
                  child:
                      TabBarView(controller: _tabController, children: const [
                    ViewOrder(isCurrent: true),
                    ViewOrder(isCurrent: false),
                  ]),
                )
              ],
            )
          : const PleaseLogin(),
    );
  }
}
