import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  double balance = 50.00;
  List<Map<String, dynamic>> transactions = [
    {
      'type': 'Credit',
      'amount': 20.00,
      'date': '2023-06-01',
      'description': 'Refund'
    },
    {
      'type': 'Debit',
      'amount': 15.50,
      'date': '2023-05-30',
      'description': 'Order #1234'
    },
    {
      'type': 'Credit',
      'amount': 50.00,
      'date': '2023-05-28',
      'description': 'Top-up'
    },
    {
      'type': 'Debit',
      'amount': 12.75,
      'date': '2023-05-25',
      'description': 'Order #1233'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet', style: AppWidget.HeadlineTextFeildStyle()),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Số dư tài khoản',
                          style: AppWidget.semiBoldTextFeildStyle()),
                      SizedBox(height: 8),
                      Text('\$${balance.toStringAsFixed(2)}',
                          style: AppWidget.boldTextFeildStyle()
                              .copyWith(fontSize: 24)),
                      SizedBox(height: 16),
                      ElevatedButton(
                        child: Text('Nạp'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                        ),
                        onPressed: () {
                          // Implement top-up logic
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text('Lịch sử giao dịch',
                  style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        transaction['type'] == 'Credit'
                            ? Icons.add_circle
                            : Icons.remove_circle,
                        color: transaction['type'] == 'Credit'
                            ? Colors.green
                            : Colors.red,
                      ),
                      title: Text(transaction['description'],
                          style: AppWidget.semiBoldTextFeildStyle()),
                      subtitle: Text(transaction['date'],
                          style: AppWidget.LightTextFeildStyle()),
                      trailing: Text(
                        '${transaction['type'] == 'Credit' ? '+' : '-'}\$${transaction['amount'].toStringAsFixed(2)}',
                        style: TextStyle(
                          color: transaction['type'] == 'Credit'
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
