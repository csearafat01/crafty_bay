import 'package:crafty_bay/data/models/response_data.dart';
import 'package:get/get.dart';
import 'package:crafty_bay/data/models/review_product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';

class ReviewProductController extends GetxController {
  var reviewProductInProgress = false.obs;
  var reviewProductModel = Rx<ReviewProductModel>(ReviewProductModel());
  var message = ''.obs;

  Future<bool> createProductReview(
      String reviewDescription, int productId, String rating) async {
    reviewProductInProgress.value = true;
    update();

    final ResponseData response = await NetworkCaller().postRequest(
      Urls.createProductReview,
    );

    reviewProductInProgress.value = false;

    if (response.isSuccess) {
      reviewProductModel.value =
          ReviewProductModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      message.value = 'Review failed! Try again';
      update();
      return false;
    }
  }
}

class ReviewController extends GetxController {
  final reviews = <Review>[].obs;
  final firstName = ''.obs;
  final lastName = ''.obs;
  final reviewText = ''.obs;

  String get getFirstName => firstName.value;
  String get getLastName => lastName.value;
  String get getReviewText => reviewText.value;

  void updateFirstName(String value) => firstName.value = value;
  void updateLastName(String value) => lastName.value = value;
  void updateReviewText(String value) => reviewText.value = value;

  void addReview() {
    reviews.add(Review(
      firstName: getFirstName,
      lastName: getLastName,
      reviewText: getReviewText,
    ));
  }

  String getReviewTitle(int index) =>
      '${reviews[index].firstName} ${reviews[index].lastName}';

  String getReviewDescription(int index) => reviews[index].reviewText;
}

class Review {
  String firstName;
  String lastName;
  String reviewText;

  Review({
    required this.firstName,
    required this.lastName,
    required this.reviewText,
  });
}
