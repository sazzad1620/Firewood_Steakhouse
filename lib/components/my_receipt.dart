import 'package:flutter/material.dart';

class MyReceipt extends StatelessWidget {
  final String trxId;
  final String paymentId;
  final double amount;
  final String method;

  const MyReceipt({
    Key? key,
    required this.trxId,
    required this.paymentId,
    required this.amount,
    required this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Payment Successful",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Method: $method"),
            Text("Amount: ৳${amount.toStringAsFixed(2)}"),
            Text("Transaction ID: $trxId"),
            Text("Payment ID: $paymentId"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Move to delivery tracking page or order summary
              },
              child: const Text("Track Delivery"),
            ),
          ],
        ),
      ),
    );
  }
}
