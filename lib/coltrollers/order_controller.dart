import '../../data/api/repository/order_repo.dart';
import '../../models/order_model.dart';
import 'package:get/get.dart';

import '../models/place_order_model.dart';

class OrderController extends GetxController implements GetxService {
  OrderRepo orderRepo;
  OrderController({required this.orderRepo});

  bool _isLoading = false;
  late List<OrderModel> _currentOrderList;
  late List<OrderModel> _historyOrderList;
  bool get isLoading => _isLoading;

  List<OrderModel> get currentOrderList => _currentOrderList;
  List<OrderModel> get historyOrderList => _historyOrderList;

  Future<void> placeOrder(PlaceOrderBody placeOrder, Function callback) async {
    _isLoading = true;
    Response response = await orderRepo.placeOrder(placeOrder);
    print("response obj : ${response.statusCode}");
    if (response.statusCode == 200) {
      print(" in status 200, from server");
      _isLoading = false;
      String message = response.body['message'];
      String orderId = response.body['order_id'].toString();
      callback(true, message, orderId);
    } else {
      callback(false, response.statusText, "-1");
    }
  }

  Future<void> getOrderList() async {
    
    _isLoading = true;
    Response response = await orderRepo.getOrderList();

    if (response.statusCode == 200) {
      _historyOrderList = [];
      _currentOrderList = [];
      response.body.forEach((order) {
        OrderModel orderModel = OrderModel.fromJson(order);
        if (orderModel.orderStatus == 'pending' ||
            orderModel.orderStatus == 'processing' ||
            orderModel.orderStatus == 'picked_up' ||
            orderModel.orderStatus == 'success') {
          _currentOrderList.add(orderModel);
          print("maybe you have a shot xx");
        } else if (orderModel.orderStatus == 'delivered' ||
            orderModel.delivered == 'true') {
          // print("Not 200 buddy,time to start learning chinese");
          _historyOrderList.add(orderModel);
        } else {
          print("NUll Values in order Model");
        }
      });
    } else {
      _historyOrderList = [];
      _currentOrderList = [];
    }
    _isLoading = false;
    print("length : ${_currentOrderList.length}");
    print("length of hist : ${_historyOrderList.length}");

    update();
    // Future.delayed(Duration(milliseconds: 20),(){update();});
  }

  bool existInHistory(int orderId) {
    if (_historyOrderList.contains(orderId)) {
      return true;
    } else {
      return false;
    }
  }

  bool existInCurrent(int orderId) {
    if (_currentOrderList.contains(orderId)) {
      return true;
    } else {
      return false;
    }
  }

  late OrderModel thatOrder;
  Future<OrderModel> getTheOrder(int orderId) async {
    late OrderModel theOrder;
    print("in getTheOrder");

    _historyOrderList.forEach((order) {
      if (order.id == orderId) {
        theOrder = order;
        print("theOrder in HIst");
      }
    });

    _currentOrderList.forEach((order) {
      if (order.id == orderId) {
        theOrder = order;
        print("theOrder in Curr");
      }
    });
    print(theOrder.handover);
    thatOrder = theOrder;

    print(thatOrder.handover);
    _isLoading = true;
    // Future.delayed(Duration(milliseconds: 20),(){update();});

    // update();

    return theOrder;
  }
}
