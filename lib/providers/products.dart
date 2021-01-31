import 'package:flutter/material.dart';
import 'product.dart';


class Products with ChangeNotifier{
  List<Product> _items =[
    Product(
        id: '1',
        title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        description: "Your perfect pack, for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        price: 109.95,
        imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
    ),
    Product(
        id: '2',
        title: "Mens Casual Premium Slim Fit T-Shirts ",
        description: "Your perfect pack, for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        price: 32,
        imageUrl: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
    ),
    Product(
        id: '3',
        title:  "Mens Cotton Jacket",
        description: "Your perfect pack, for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        price: 209.95,
        imageUrl: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg"
    ),
    Product(
        id: '4',
        title: "Mens Casual Slim Fit",
        description: "Your perfect pack, for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        price: 9.00,
        imageUrl: "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg"
    ),
    Product(
        id: '5',
        title: "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
        description: "Your perfect pack, for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        price: 109,
        imageUrl:  "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg"
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
     return _items.where((element) => element.isFavorite).toList();
  }

  void addProduct(){
//    _items.add(value);
    notifyListeners();
  }

  Product findByID(String productID){
    return _items.firstWhere((element) => element.id == productID);
  }
}