import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ReviewController extends GetxController {
  final RxList<Review> reviews = <Review>[].obs;
  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString reviewText = ''.obs;

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
