import 'package:get/get.dart';

import '../../../models/place_order_model.dart';
import '../../../utills/app_constants.dart';
import '../api_client.dart';

class OrderDetailRepo {
  final ApiClient apiClient;
  OrderDetailRepo({required this.apiClient});

//  Future<Response> placeOrder(PlaceOrderBody placeOrder) async {
//     return await apiClient.postData(AppConstants.PLACE_ORDER_URI, placeOrder.toJson());
//   }
   Future<Response> getOrderDetailList () async {
    return await apiClient.getData(AppConstants.GET_ORDER_DETAIL_LIST_URI);
  }
}
