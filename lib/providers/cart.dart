import 'package:flutter/material.dart';

class CartItems{
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItems({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price
  });
}
class Cart with ChangeNotifier {
  Map<String, CartItems> _items = {};

  Map<String, CartItems> get items{
    return {..._items};
  }

  int get itemCount{
    var itemsCount = 0;
    if(_items == null){
      return 0;
    }
    _items.forEach((key, cartItem) {
      itemsCount += cartItem.quantity;
    });
    return itemsCount;
  }

  double get totalAmount{
    var total  = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productID, double price, String title){
    if(_items.containsKey(productID)){
      // change quantity
      _items.update(productID, (product) => CartItems(
        id: product.id,
        title: product.title,
        quantity: product.quantity + 1,
        price: product.price
      ));
    }else{
      _items.putIfAbsent(productID, () => CartItems(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }

  void removeItem(String productID){
    print(productID);
    _items.remove(productID);
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }

}