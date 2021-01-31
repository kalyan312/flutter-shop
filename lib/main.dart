import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/cart.dart';
import 'package:test_app/screens/cart_screen.dart';
import 'package:test_app/screens/products_overview_screen.dart';
import 'screens/product_details_screen.dart';
import './providers/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
      ChangeNotifierProvider(
        create: (ctx) => Cart(),
      )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orange,
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          CartScreen.routeName:(ctx)            => CartScreen()
        },
      ),
    );
  }
}
