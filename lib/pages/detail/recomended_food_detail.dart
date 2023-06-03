// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_boy_app/coltrollers/order_detail_controller.dart';
import 'package:delivery_boy_app/models/order.dart';
import 'package:delivery_boy_app/widgets/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../coltrollers/order_controller.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utills/colors.dart';
import '../../utills/dimensions.dart';
import '../../utills/styles.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_widget.dart';
import '../home_page.dart';
import '../order/order_page.dart';

class RecomendedFoodDetail extends StatefulWidget {
  int pageId;
  RecomendedFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  State<RecomendedFoodDetail> createState() => _RecomendedFoodDetailState();
}

class _RecomendedFoodDetailState extends State<RecomendedFoodDetail> {
  // Future<OrderModel> go() async {
  //   return Get.find<OrderController>().getTheOrder(widget.pageId);
  // }

  @override
  void initState() {
    super.initState();
    print(" in det ");

    // Get.find<OrderController>().thatOrder;
  }
  

  @override
  Widget build(BuildContext context) {
    // Get.find<OrderController>().thatOrder;
    // var product =
    //     Get.find<OrderDetailController>().filteredOrders[widget.pageId];
    print(" in det 2");
    // Get.find<PopularProductController>()
    //     .initProduct(Get.find<CartController>(), recomendedProduct);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("All Orders"),
        backgroundColor: AppColors.mainColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {
              // Get.find<OrderController>().getOrderList();
              // Get.toNamed(RouteHelper.getInital());
              Get.back();
              // Get.to(OrderPage());
              // Navigator.pop(context);
            
              
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<OrderController>(builder: (orderController) {
        Widget timeWidget() {
          final dateTime =
              DateTime.parse(orderController.thatOrder.createdAt.toString());

          final format = DateFormat('yyyy-MM-dd HH:mm a');
          final clockString = format.format(dateTime);

          return Text(
            clockString.toString(),
            style: robotoMedium.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: Dimensions.fontSize20,
            ),
          );
        }

        print("object");
        print(orderController.thatOrder.refunded.toString());

        orderController.getTheOrder(widget.pageId);
        return orderController.isLoading
            ? Container(
                margin: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(
                          text: "...............................",
                          color: Theme.of(context).disabledColor),
                      SizedBox(height: Dimensions.Width30),
                      Row(children: [
                        Text(
                          "Order ID: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        Text(
                          orderController.thatOrder.id.toString(),
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        // BigText(text: orderController.thatOrder.id.toString())
                      ]),
                      SizedBox(height: Dimensions.Height5),
                      Row(children: [
                        Text(
                          "Order Status: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        Text(
                          orderController.thatOrder.orderStatus.toString(),
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        // BigText(text: orderController.thatOrder.id.toString())
                      ]),
                      SizedBox(height: Dimensions.Height5),
                      Row(children: [
                        Text(
                          "To User: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        Text(
                          orderController.thatOrder.accepted.toString(),
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        // BigText(text: orderController.thatOrder.id.toString())
                      ]),
                      SizedBox(height: Dimensions.Height5),
                      Row(children: [
                        Text(
                          "To Phone: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        Text(
                          orderController.thatOrder.confirmed.toString(),
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        // BigText(text: orderController.thatOrder.id.toString())
                      ]),
                      SizedBox(height: Dimensions.Height5),
                      Row(children: [
                        Text(
                          "Location: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        Text(
                          orderController.thatOrder.refunded == Null ||
                                  orderController.thatOrder.refunded == ""
                              ? "Unspecified"
                              : orderController.thatOrder.refunded.toString(),
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        // BigText(text: orderController.thatOrder.id.toString())
                      ]),
                      SizedBox(height: Dimensions.Height5),
                      Row(children: [
                        Text(
                          "Longitude: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        Text(
                          orderController.thatOrder.handover.toString(),
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        // BigText(text: orderController.thatOrder.id.toString())
                      ]),
                      SizedBox(height: Dimensions.Height5),
                      Row(children: [
                        Text(
                          "Latitude: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        Text(
                          orderController.thatOrder.pickedUp.toString(),
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        // BigText(text: orderController.thatOrder.id.toString())
                      ]),
                      SizedBox(height: Dimensions.Height5),
                      Row(children: [
                        Text(
                          "Ordered At: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        timeWidget()
                        // BigText(text: orderController.thatOrder.id.toString())
                      ]),
                      SizedBox(height: Dimensions.Height5),
                      Row(children: [
                        Text(
                          "Payment Status: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        Text(
                          orderController.thatOrder.paymentStatus.toString(),
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                      ]),
                      SizedBox(height: Dimensions.Height5),
                      Row(children: [
                        Text(
                          "Paid Amount: ",
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                        SizedBox(height: Dimensions.Width5),
                        Text(
                          orderController.thatOrder.orderAmount.toString(),
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSize20,
                          ),
                        ),
                      ]),
                      SizedBox(height: Dimensions.Height5 * 4),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                " - Food Items in the Order - ",
                                style: robotoMedium.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: Dimensions.fontSize16,
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: Dimensions.Height5 * 3),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "........",
                            style: robotoMedium.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: Dimensions.fontSize20,
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: Dimensions.Height5),

                      GetBuilder<OrderDetailController>(
                          builder: (orderDetailController) {
                        List<Map> orderDetailList = [];

                        if (orderDetailController.filteredOrders.isNotEmpty) {
                          orderDetailList =
                              orderDetailController.getTheOrder(widget.pageId);
                        }
                        return orderDetailController.isLoading == false
                            ? ListView.builder(
                                // addAutomaticKeepAlives: true,
                                reverse: true,
                                shrinkWrap:
                                    true, //use it with AlwaysScrollableScrollPhysics
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: orderDetailList.length,
                                itemBuilder: (context, index) {
                                  print(" the hhh " + index.toString());
                                  return Column(children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Food Id: ",
                                          style: robotoMedium.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: Dimensions.fontSize20,
                                          ),
                                        ),
                                        SizedBox(height: Dimensions.Width5),
                                        Text(
                                          orderDetailList[index]['foodsId']
                                              .toString(),
                                          style: robotoMedium.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: Dimensions.fontSize20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(children: [
                                      Text(
                                        "Food Name: ",
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.Width5),
                                      Text(
                                        orderDetailList[index]['foodName']
                                            .toString(),
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: Dimensions.Height5),
                                    Row(children: [
                                      Text(
                                        "Food Price: ",
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.Width5),
                                      Text(
                                        orderDetailList[index]['foodPrice']
                                            .toString(),
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: Dimensions.Height5),
                                    Row(children: [
                                      Text(
                                        "Food Location: ",
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.Width5),
                                      Text(
                                        orderDetailList[index]['foodlocation']
                                            .toString(),
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: Dimensions.Height5),
                                    Row(children: [
                                      Text(
                                        "Food Date: ",
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.Width5),
                                      Text(
                                        orderDetailList[index]['foodCreated']
                                            .toString(),
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                    ]),
                                    SizedBox(height: Dimensions.Height5),
                                    Row(children: [
                                      Text(
                                        "Food Quantity: ",
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.Width5),
                                      Text(
                                        orderDetailList[index]['foodQuantity']
                                            .toString(),
                                        style: robotoMedium.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSize20,
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Text(
                                          "........",
                                          style: robotoMedium.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: Dimensions.fontSize20,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ]);
                                })
                            : const CustomLoader();
                      }),

                      //index is the number of items you want in the list

                      SizedBox(height: Dimensions.Width30),
                      BigText(
                          text: "...............................",
                          color: Theme.of(context).disabledColor),
                      SizedBox(height: Dimensions.Width30),
                    ],
                  ),
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
