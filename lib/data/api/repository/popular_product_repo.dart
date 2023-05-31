
import 'package:get/get.dart';

import '../../../utills/app_constants.dart';
import '../api_client.dart';

class PopularPoductRepo extends GetxService {
  final ApiClient apiClient;

  PopularPoductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    //TODO: End point 
    // return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
