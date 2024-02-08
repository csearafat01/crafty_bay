
import 'package:crafty_bay/presentation/ui/screens/payment_webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/payment_method.dart';
import '../../state_holders/create_invoice_controller.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInvoice().then((value) {
        isCompleted = value;
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Check out'),
        ),
        body: GetBuilder<CreateInvoiceController>(
            builder: (controller) {
              if (controller.inProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!isCompleted) {
                return const Center(
                  child: Text('Please complete your profile first'),
                );
              }
              return ListView.separated(
                itemCount: controller.paymentMethodListModel.paymentMethod?.length ?? 0,
                itemBuilder: (context, index) {
                  final PaymentMethod paymentMethod =
                  controller.paymentMethodListModel.paymentMethod![index];
                  return ListTile(
                    leading: Image.network(paymentMethod.logo ?? '', width: 60,),
                    title: Text(paymentMethod.name ?? ''),
                    onTap: () {
                      Get.off(() => PaymentWebViewScreen(paymentUrl: paymentMethod.redirectGatewayURL!, url: '',));
                    },
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              );
            }
        )
    );
  }
}