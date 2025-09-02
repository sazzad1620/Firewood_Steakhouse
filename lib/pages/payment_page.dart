import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/payment_helper.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String? selected;

  List<Map> gateways = [
    {
      'name': 'bKash',
      'logo':
          'https://freelogopng.com/images/all_img/1656234841bkash-icon-png.png',
    },
    {
      'name': 'SSLCOMMERZ',
      'logo':
          'https://apps.odoo.com/web/image/loempia.module/193670/icon_image?unique=c301a64',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Lighter/ash colors for boxes/buttons
    final boxColor = colorScheme.brightness == Brightness.light
        ? Colors.white // main background & boxes white for light mode
        : colorScheme.secondary; // dark mode background for tiles

    final selectedBorderColor = colorScheme.brightness == Brightness.light
        ? Colors.grey.shade400
        : const Color.fromARGB(255, 162, 162, 162); // ash border on selection

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.inversePrimary,
        elevation: 0,
      ),
      backgroundColor: colorScheme.brightness == Brightness.light
          ? Colors.white
          : colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select a payment method",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: gateways.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final gateway = gateways[index];
                        return PaymentMethodTile(
                          logo: gateway['logo'],
                          name: gateway['name'],
                          selected: selected ?? '',
                          boxColor: boxColor,
                          selectedBorderColor: selectedBorderColor,
                          onTap: () {
                            selected = gateway['name']
                                .toString()
                                .replaceAll(' ', '_')
                                .toLowerCase();
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Button without extra padding
          MyButton(
            text: "Continue to payment",
            onTap: selected == null
                ? null
                : () => onButtonTap(context, selected ?? ''),
            isDisabled: selected == null,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String logo;
  final String name;
  final Function()? onTap;
  final String selected;
  final Color boxColor;
  final Color selectedBorderColor;

  const PaymentMethodTile({
    super.key,
    required this.logo,
    required this.name,
    this.onTap,
    required this.selected,
    required this.boxColor,
    required this.selectedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isSelected = selected == name.replaceAll(' ', '_').toLowerCase();

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? selectedBorderColor : Colors.black12,
            width: 2,
          ),
        ),
        child: ListTile(
          leading: Image.network(
            logo,
            height: 35,
            width: 35,
          ),
          title: Text(
            name,
            style: TextStyle(
              color: colorScheme.inversePrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
