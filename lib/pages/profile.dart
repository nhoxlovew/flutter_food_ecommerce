import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widget/widget_support.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: AppWidget.HeadlineTextFeildStyle()),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Hoàng Anh',
                  style: AppWidget.boldTextFeildStyle(),
                ),
              ),
              SizedBox(height: 30),
              Text('Personal Information',
                  style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('johndoe@example.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text('+1 234 567 8900'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Address'),
                subtitle: Text('123 Burger Street, Food City, 12345'),
              ),
              SizedBox(height: 30),
              Text('Order History', style: AppWidget.semiBoldTextFeildStyle()),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Order #${1000 + index}'),
                    subtitle: Text('2 items - \$24.99'),
                    trailing: Text('Delivered',
                        style: TextStyle(color: Colors.green)),
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
