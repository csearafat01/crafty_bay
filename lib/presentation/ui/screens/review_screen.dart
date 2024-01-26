import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/review_controller.dart';
import '../widgets/home/circle_icon_button.dart';
import 'create_review_screen.dart';

class ReviewPage extends StatelessWidget {
  final ReviewController reviewController = Get.put(ReviewController());

  ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: reviewController.reviews.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CircleIconButton(
                              onTap: () {},
                              iconData: Icons.person,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${reviewController.reviews[index].firstName}'
                              ' ${reviewController.reviews[index].lastName}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight:FontWeight.w600,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          ' ${reviewController.reviews[index].reviewText}',
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateReviewPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
