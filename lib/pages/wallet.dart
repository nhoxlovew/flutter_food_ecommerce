import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widget/app_constant.dart';
import 'package:flutter_ecommerce/widget/widget_support.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Ví tiền",
                      style: AppWidget.HeadlineTextFeildStyle(),
                    )))),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(
                children: [
                  Image.asset(
                    "images/wallet.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ví của bạn:",
                        style: AppWidget.LightTextFeildStyle(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "\$" + "100", // về sau đổi thành đơn vị tiền tệ VNĐ
                        style: AppWidget.boldTextFeildStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Nạp tiền",
                style: AppWidget.semiBoldTextFeildStyle(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    makePayment('100');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "100",// về sau đổi thành đơn vị tiền tệ VNĐ
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makePayment('500');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "500",// về sau đổi thành đơn vị tiền tệ VNĐ
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makePayment('1000');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "1000",// về sau đổi thành đơn vị tiền tệ VNĐ
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makePayment('2000');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "2000",
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                ();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFF008080),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Add Money",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      print("Starting payment for amount: $amount");
      paymentIntent = await createPaymentIntent(amount, 'INR');
      print("Payment Intent created: $paymentIntent");

      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Anh'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(amount);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(String amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Thanh toán thành công"),
                        ],
                      ),
                    ],
                  ),
                ));
        // ignore: use_build_context_synchronously
        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount) * 100);
    return calculatedAmount.toString();
  }
}
