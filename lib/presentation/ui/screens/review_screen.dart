import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'create_review_screen.dart';


class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: const Column(
        children: [
          // Display reviews here
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CreateReviewPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


