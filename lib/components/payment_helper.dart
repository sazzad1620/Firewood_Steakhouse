import 'package:bkash/bkash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'dart:convert';

double totalPrice = 10.00;

// initialize bKash SDK
final bkash = Bkash(logResponse: true);

/// Handles button tap and triggers payment based on selected gateway
void onButtonTap(BuildContext context, String selected) async {
  switch (selected) {
    case 'bkash':
      await bkashPayment(context);
      break;

    case 'sslcommerz':
      sslcommerz();
      break;

    default:
      print("No gateway selected");
  }
}

/// Main bKash payment function
Future<void> bkashPayment(BuildContext context) async {
  try {
    final response = await bkash.pay(
      context: context, // ✅ using widget context instead of Get.context!
      amount: totalPrice,
      merchantInvoiceNumber: 'Test012345',
    );

    if (response != null) {
      print("Transaction ID: ${response.trxId}");
      print("Payment ID: ${response.paymentId}");
    } else {
      print("Payment failed or was cancelled.");
    }
  } on BkashFailure catch (e) {
    print("Bkash error: ${e.message}");
  } catch (e) {
    print("Unexpected error: $e");
  }
}

/// SslCommerz
void sslcommerz() async {
  Sslcommerz sslcommerz = Sslcommerz(
    initializer: SSLCommerzInitialization(
      multi_card_name: "visa,master,bkash",
      currency: SSLCurrencyType.BDT,
      product_category: "Digital Product",
      sdkType: SSLCSdkType.TESTBOX,
      store_id: "sazza68b485ecbd277",
      store_passwd: "sazza68b485ecbd277@ssl",
      total_amount: totalPrice,
      tran_id: "TestTRX001",
    ),
  );

  final response = await sslcommerz.payNow();

  if (response.status == 'VALID') {
    print(jsonEncode(response));

    print('Payment completed, TRX ID: ${response.tranId}');
    print(response.tranDate);
  }

  if (response.status == 'Closed') {
    print('Payment closed');
  }

  if (response.status == 'FAILED') {
    print('Payment failed');
  }
}
