import 'package:bkash/bkash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:food_delivery_app/pages/delivery_process_lage.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/delivery_process_page.dart';

/// Handles button tap and triggers payment based on selected gateway
void onButtonTap(BuildContext context, String selected) async {
  // Get total price from Restaurant provider and convert to double
  final totalPriceInt = context.read<Restaurant>().getTotalPrice();
  final totalPrice = totalPriceInt.toDouble();

  switch (selected) {
    case 'bkash':
      await bkashPayment(context, totalPrice);
      break;

    case 'sslcommerz':
      sslcommerz(context, totalPrice);
      break;

    default:
      print("No gateway selected");
  }
}

/// Initialize bKash SDK
final bkash = Bkash(logResponse: true);

/// Main bKash payment function
Future<void> bkashPayment(BuildContext context, double totalPrice) async {
  try {
    final response = await bkash.pay(
      context: context,
      amount: totalPrice,
      merchantInvoiceNumber: 'Test012345',
    );

    if (response != null) {
      print("Transaction ID: ${response.trxId}");
      print("Payment ID: ${response.paymentId}");
      // Navigate to DeliveryProcessPage with receipt info
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DeliveryProcessPage(
            trxId: response.trxId,
            paymentId: response.paymentId,
            amount: totalPrice,
            method: "bKash",
          ),
        ),
      );
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
void sslcommerz(BuildContext context, double totalPrice) async {
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

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => DeliveryProcessPage(
          trxId: response.tranId ?? '',
          paymentId: response.bankTranId ?? '',
          amount: totalPrice,
          method: "SSLCommerz",
        ),
      ),
    );
  }

  if (response.status == 'Closed') {
    print('Payment closed');
  }

  if (response.status == 'FAILED') {
    print('Payment failed');
  }
}
