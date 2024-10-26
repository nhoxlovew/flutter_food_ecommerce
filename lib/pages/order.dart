import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widget/widget_support.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<Map<String, dynamic>> cartItems = [
    {'name': 'Classic Burger', 'price': 9.99, 'quantity': 2},
    {'name': 'Cheese Fries', 'price': 4.99, 'quantity': 1},
    {'name': 'Soda', 'price': 1.99, 'quantity': 2},
  ];

  double get total => cartItems.fold(
      0, (sum, item) => sum + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order', style: AppWidget.HeadlineTextFeildStyle()),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item['name'],
                      style: AppWidget.semiBoldTextFeildStyle()),
                  subtitle: Text('\$${item['price']}',
                      style: AppWidget.LightTextFeildStyle()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (item['quantity'] > 1) {
                              item['quantity']--;
                            } else {
                              cartItems.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text('${item['quantity']}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            item['quantity']++;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:', style: AppWidget.semiBoldTextFeildStyle()),
                    Text('\$${total.toStringAsFixed(2)}',
                        style: AppWidget.boldTextFeildStyle()),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text(
                    'Place Order',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    // Implement order placement logic
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
