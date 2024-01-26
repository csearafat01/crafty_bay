import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/review_controller.dart';

class CreateReviewPage extends StatelessWidget {
  final ReviewController reviewController = Get.put(ReviewController());

  CreateReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'First Name'),
              onChanged: reviewController.updateFirstName,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Last Name'),
              onChanged: reviewController.updateLastName,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Write Review'),
              maxLines: 5,
              onChanged: reviewController.updateReviewText,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement the logic to save the review
                reviewController.addReview();
                Get.back();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
