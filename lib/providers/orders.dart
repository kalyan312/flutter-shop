import 'package:flutter/material.dart';
import 'package:test_app/widgets/cart_item.dart';

class OrderItems{

  final String id;
  final double price;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItems({
    @required this.id,
    @required this.price,
    @required this.products,
    @required this.dateTime
  });

}

class Orders with ChangeNotifier{
  List<OrderItems> _orders = [];
  
  List<OrderItems> get orders{
    return [...orders];
  }
  
  void addOrder(List<CartItem> cartProducts, double total){
    _orders.insert(0, OrderItems(id: DateTime.now().toString(), price: total, products: cartProducts, dateTime: DateTime.now()));
    notifyListeners();
  }

}