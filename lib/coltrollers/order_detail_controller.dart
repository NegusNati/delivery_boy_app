import 'package:get/get.dart';

import '../data/api/repository/order_detail_repo.dart';
import '../models/order.dart';

class OrderDetailController extends GetxController implements GetxService {
  OrderDetailRepo orderDetailRepo;
  OrderDetailController({required this.orderDetailRepo});
  final List<Order> _orders =
      []; // assume this is populated with the orders data
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Order> _filteredOrders = [];
  List<Order> get filteredOrders => _filteredOrders;

  Future<void> getOrderDetailList() async {
    _isLoading = true;
    Response response = await orderDetailRepo.getOrderDetailList();
    if (response.statusCode == 200) {
      print(response.body.toString());
      _filteredOrders = [];
      response.body.forEach((order) {
        Order orderModel = Order.fromJson(order);
        if (true) {
          // _filteredOrders.add(order);
          _filteredOrders.add(orderModel);
          // print(_filteredOrders[0].toString());
          print("got the det  ");
        }
      });
    } else {
      print("in Elseeeeeeeeeeee");
      print("response code of ${response.statusCode}");
    }

    _isLoading = false;
    update();

    // Future.delayed(Duration(milliseconds: 20),(){update();});
  }

  late Order thatOrder;

  List<Map> getTheOrder(int orderId) {
    late Order theOrder;
    late List<Detail> theOrderDetail;
    late Detail detail;
    List<Map<dynamic, dynamic>> orderDetailList = [];

    late Map<String, dynamic> resp;
    print("in getTheOrder of detail ");

    // print("in getTheOrder of detail${_filteredOrders[0].orderId}");
    // print("in getTheOrder of detail${_filteredOrders[0].details}");

    for (var order in _filteredOrders) {
      print('order .......... $order');
      if (order.orderId == orderId) {
        print('id .......... ');

        theOrderDetail = order.details!;
        // theOrderDetail.fromJson(jsonDecode(element))

        print(theOrderDetail[0].foodDetails.name.toString());
        print(" did it ? ");
        for (var detail in theOrderDetail) {
          // orderDetailList = [];
          if (theOrderDetail.isNotEmpty) {
            resp = {
              "foodsId": detail.foodDetails.id.toString(),
              "foodName": detail.foodDetails.name.toString(),
              "foodDescription": detail.foodDetails.description.toString(),
              "foodPrice": detail.foodDetails.price.toString(),
              "foodStrars": detail.foodDetails.price.toString(),
              "foodlocation": detail.foodDetails.location.toString(),
              "foodCreated": detail.foodDetails.createdAt.toString(),
              "foodQuantity": detail.quantity.toString(),
            };

            orderDetailList.add(resp);
            print("theOrder from detail ${detail.foodDetails.name}");
          }
        }
      }
    }

    print(" ....... ");
    _isLoading = false;
    // Future.delayed(Duration(milliseconds: 20),(){update();});

    update();

    return orderDetailList;

    // update();
  }
}
