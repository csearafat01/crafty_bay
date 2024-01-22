import 'package:flutter/material.dart';

class CreateReviewPage extends StatelessWidget {
  const CreateReviewPage({super.key});

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
            const TextField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            const SizedBox(height: 16,),
            const TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            const SizedBox(height: 16,),
            const TextField(
              decoration: InputDecoration(labelText: 'Write Review'),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement the logic to save the review
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}