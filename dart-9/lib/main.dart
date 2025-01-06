import 'package:flutter/material.dart';
import 'model/welcome.dart';
import 'model/login.dart';
import 'model/dashboard.dart';
import 'model/register.dart';
import 'model/cart.dart';
import 'model/checkout.dart';
import 'model/payment.dart';
import 'model/thankyou.dart';
import 'model/profile.dart';
import 'model/purchase_history.dart';
import 'screens/admin_dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fatlem Wekidi くん',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/dashboard': (context) => Dashboard(),
        '/profile': (context) => Profile(),
        '/cart': (context) => Cart(cartItems: []),
        '/checkout': (context) => Checkout(),
        '/payment': (context) => Payment(totalAmount: ModalRoute.of(context)!.settings.arguments as double),
        '/thankyou': (context) => ThankYouScreen(),
        '/purchase_history': (context) => PurchaseHistory(),
        '/admin_dashboard': (context) => AdminDashboard(),
      },
    );
  }
}
