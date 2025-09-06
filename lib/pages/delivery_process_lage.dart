import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_receipt.dart';

class DeliveryProcessPage extends StatelessWidget {
  final String trxId;
  final String paymentId;
  final double amount;
  final String method;

  const DeliveryProcessPage({
    Key? key,
    required this.trxId,
    required this.paymentId,
    required this.amount,
    required this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delivery Process")),
      body: Center(
        child: MyReceipt(
          trxId: trxId,
          paymentId: paymentId,
          amount: amount,
          method: method,
        ),
      ),
    );
  }
}
