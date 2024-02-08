import 'package:crafty_bay/data/models/response_data.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class AddToCartController extends GetxController {
  bool _addToCartInProgress = false;
  String _message = '';

  bool get addToCartInProgress => _addToCartInProgress;

  String get message => _message;

  get inProgress => null;

  get errorMessage => null;

  Future<bool> addToCart(int productId, String color, String size, int quantity) async {
    _addToCartInProgress = true;
    update();

    final ResponseData response = await NetworkCaller().postRequest(
        Urls.addToCart,
        {"product_id": productId.toString(), "color": color, "size": size, "qty": quantity.toString()});
    _addToCartInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _message = 'Add to cart failed! Try again';
      update();
      return false;
    }
  }
}
