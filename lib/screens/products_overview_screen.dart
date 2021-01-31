import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/cart.dart';
import 'package:test_app/screens/cart_screen.dart';
import 'package:test_app/widgets/badge.dart';
import '../providers/products.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreen createState() => _ProductsOverviewScreen();
}


class _ProductsOverviewScreen extends State<ProductsOverviewScreen> {
  var _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if(value == FilterOptions.Favorites){
                  _showOnlyFavorite = true;
                }else{
                  _showOnlyFavorite = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Favorites"),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.All,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorite),
    );
  }
}
